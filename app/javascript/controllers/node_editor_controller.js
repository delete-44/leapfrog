import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="node-editor"
export default class extends Controller {
  static targets = ["formContainer", "node"];

  connect() {
    console.log("Connected");
  }

  async selectNode(event) {
    event.preventDefault();
    const nodeId = event.currentTarget.dataset.nodeId;

    // Using native fetch API
    fetch(`/nodes/${nodeId}/edit`)
      .then((response) => response.text())
      .then((html) => {
        this.formContainerTarget.classList.remove("opacity-0");
        this.formContainerTarget.innerHTML = html;
      })
      .catch((error) => console.error("Error fetching form:", error));
  }

  startConnection(event) {
    event.preventDefault();

    const parentNodeId = event.currentTarget.dataset.parentNodeId;

    // Add glow effect & update action for valid targets
    this.nodeTargets.forEach((el) => {
      if (el.dataset.nodeId === parentNodeId) {
        return;
      }

      el.classList.add("shadow-lg");
      el.classList.add("shadow-purple-200");
      el.dataset.parentNodeId = parentNodeId;
      el.dataset.action = "node-editor#finishConnection";
    });
  }

  // STUB i hate this
  finishConnection(event) {
    event.preventDefault();

    const parentNodeId = event.currentTarget.dataset.parentNodeId;
    const childNodeId = event.currentTarget.dataset.nodeId;

    this.postConnection(parentNodeId, childNodeId);
  }

  postConnection(parentNodeId, childNodeId) {
    // Retrieve CSRF Token from the meta tag
    const csrfToken = document
      .querySelector("[name='csrf-token']")
      .getAttribute("content");

    fetch("/connections", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        "X-CSRF-Token": csrfToken, // Ensure CSRF token is included for Rails authenticity
      },
      body: JSON.stringify({
        connection: {
          parent_node_id: parentNodeId,
          child_node_id: childNodeId,
        },
      }),
    })
      .then((response) => {
        if (!response.ok) {
          throw new Error("Network response was not ok");
        }
        return response.json();
      })
      .then((data) => {
        console.log("Success:", data);
      })
      .catch((error) => {
        console.error("Error:", error);
      });
  }
}
