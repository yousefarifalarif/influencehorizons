
import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ['popup'];

  connect() {
    console.log(this.popupTarget);
  }
}
