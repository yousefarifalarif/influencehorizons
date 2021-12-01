import { Controller } from "stimulus"

export default class extends Controller {

  static targets = ["product", "btn", "cards"]

  connect() {
    // console.log(this.productTarget);
  }

  sendProposal() {
    console.log('sending proposal. LEts open modal')
    // fetch IDs of selected influences
    const elements = Array.from(document.querySelectorAll(".card-product.selected"))
    const ids = elements.map(el => el.dataset.id)

    const hiddenProposalIdsInput = document.getElementById("proposal_influencer_ids")
    hiddenProposalIdsInput.value = ids
    // select influencer IDS hidden field and put ids on as value of that field
    // something like myHiddenFormInput.value = ids
  }

  toggleDisable(event) {
    // this.btnTarget.setAttribute("disabled", false);
    const id = event.target.dataset.id
    let card = [...this.productTarget.children].filter(child => parseInt(child.dataset.id) == parseInt(id))[0]

    // console.log(card)
    card.setAttribute("selected", true);
    // card.classList.toggle("card-product");
    card.classList.toggle("selected");
    // this.btnTarget.classList.toggle("proposal-btn-active");
    // const array = []
    // document.querySelectorAll('.selected').forEach(card => array.push(card.dataset.id))
    // this.btnTarget.dataset.id = array
    this.btnTarget.dataset.id = card.dataset.id
    this.enableSendProposal()
  }

  enableSendProposal(){
    console.log(this.cardsTargets.some((card) => { return card.classList.contains("selected") }))
    if (this.cardsTargets.some((card) => {return card.classList.contains("selected");})) {
      this.btnTarget.classList.add("proposal-btn-active");
    } else {
      this.btnTarget.classList.remove("proposal-btn-active");
    }
  }
}
