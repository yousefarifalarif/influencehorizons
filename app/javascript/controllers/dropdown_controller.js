import { Controller } from "stimulus"
let toggled = false;

export default class extends Controller {

  static targets = ["container", "btn"]

  connect() {
    console.log(this.containerTarget);
  }

  toggleContent () {
    this.containerTarget.classList.toggle("d-none");
    this.btnTarget.classList.toggle("fa-caret-up");
    this.btnTarget.classList.toggle("fa-caret-down");

    // if (toggled === false) {
    //   this.btnTarget.innerText = "Expand";
    //   toggled = true;
    // }
    // else {
    //   this.btnTarget.innerText = "Collapse";
    //   toggled = false;
    // }
  }
}
