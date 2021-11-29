import { Controller } from "stimulus"

export default class extends Controller {

  static targets = ["product", "btn", "cards"]

  connect() {
    // console.log(this.productTarget);
  }

  toggleDisable(event) {
    // this.btnTarget.setAttribute("disabled", false);
    const id = event.target.dataset.id
    let card = [...this.productTarget.children].filter(child => parseInt(child.dataset.id) == parseInt(id))[0]

    // console.log(card)
    card.setAttribute("selected", true);
    // card.classList.toggle("card-product");
    card.classList.toggle("selected");
    this.btnTarget.classList.toggle("proposal-btn-active");
    // const array = []
    // document.querySelectorAll('.selected').forEach(card => array.push(card.dataset.id))
    // this.btnTarget.dataset.id = array
    this.btnTarget.dataset.id = card.dataset.id
  }
}
