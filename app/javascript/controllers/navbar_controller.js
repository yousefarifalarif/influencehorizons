import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  updateNavbar() {
    if (window.scrollY >= window.innerHeight * 0.2) {
      this.element.classList.add('navbar-lewagon-white');
      this.element.classList.add('navbar-light');
    } else {
      this.element.classList.remove('navbar-lewagon-white');
      this.element.classList.remove('navbar-light');
    }
  };
}
