import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="node-editor"
export default class extends Controller {
  connect() {
    console.log("Connected");
  }

  selectNode(event) {
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
