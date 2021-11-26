import { Controller } from "stimulus"

export default class extends Controller {

  static targets = ["product", "btn"]

  connect() {
    console.log(this.productTarget);
  }

  toggleDisable() {
    this.btnTarget.setAttribute("disabled", false);
    this.productTarget.setAttribute("selected", true);
  }
}
