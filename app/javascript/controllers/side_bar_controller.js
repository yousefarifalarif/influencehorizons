import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["sidebar"]
  toggle(event) {
    console.log(event.currentTarget)
    this.sidebarTarget.classList.toggle('sidebar-expanded')
  }
}
