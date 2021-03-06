import { Controller } from "stimulus"
let toggled = false;

export default class extends Controller {

  static targets = ["container", "btn"]

  toggleContent () {
    this.containerTarget.classList.toggle("card-container-shrinked");
    this.btnTarget.classList.toggle("fa-caret-up");
    this.btnTarget.classList.toggle("fa-caret-down");
  }
}
