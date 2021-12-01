import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ['form', 'input', 'list'];

  connect() {
    console.log(this.formTarget);
    console.log(this.inputTarget);
    console.log(this.listTarget);
  }

  update(event) {
    const url = `${this.formTarget.action}?query=${this.inputTarget.value}`
    fetch(url, { headers: { 'Accept': 'text/plain' } })
      .then(response => response.text())
      .then((data) => {
        this.listTarget.innerHTML = data;
      })
  }
}
