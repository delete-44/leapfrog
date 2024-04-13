import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="node-editor"
export default class extends Controller {
  static targets = ["formContainer"];

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

  selectNodex(event) {
    event.preventDefault();

    const button = event.currentTarget;
    const nodeId = button.dataset.nodeId;
    const nodeDescription = button.dataset.nodeDescription;

    const form = document.getElementById("node-form");

    form.classList.remove("opacity-0");

    const descriptionTextArea = form.querySelector(
      "[name='node[description]']"
    );
    const methodInput = form.querySelector("[name='_method']");

    form.action = `/nodes/${nodeId}`;
    descriptionTextArea.value = nodeDescription;

    // Set up the form for an update operation
    if (methodInput) {
      methodInput.value = "patch";
    } else {
      const hiddenMethodInput = document.createElement("input");
      hiddenMethodInput.setAttribute("type", "hidden");
      hiddenMethodInput.setAttribute("name", "_method");
      hiddenMethodInput.setAttribute("value", "patch");
      form.appendChild(hiddenMethodInput);
    }
  }
}