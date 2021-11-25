import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["sidebar", "button", "main"]
  toggle(event) {
    this.sidebarTarget.classList.toggle('sidebar-shrinked')
    this.mainTarget.classList.toggle('main-expanded')
    this.buttonTarget.classList.toggle('button-to-left')
    this.buttonTarget.classList.toggle('fa-angle-left')
    this.buttonTarget.classList.toggle('fa-angle-right')

  }
}
