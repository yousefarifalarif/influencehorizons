import { Controller } from "stimulus"
let toggled = false;

export default class extends Controller {

  static targets = ["container", "btn"]

  connect() {
    console.log(this.containerTarget);
  }

  toggleContent () {
    this.containerTarget.classList.toggle("d-none");
    if (toggled === false) {
      this.btnTarget.innerText = "Expand";
      toggled = true;
    }
    else {
      this.btnTarget.innerText = "Collapse";
      toggled = false;
    }
  }
}
