import { Controller } from "stimulus";
import consumer from "../channels/consumer";

export default class extends Controller {
  static values = { chatroomId: Number, currentUserId: Number, proposalId: Number }
  static targets = ["input", "messages", "chatroom"]

  connect() {
    console.log("connected");

    $(`#modal-${this.proposalIdValue}`).on('show.bs.modal', (e) => {
      setTimeout(()=> {
        this.element.firstElementChild.scrollTop = this.element.firstElementChild.scrollHeight;
      }, 200);
    })

    this.channel = consumer.subscriptions.create(
      { channel: "ChatroomChannel", id: this.chatroomIdValue },
      { received: data => {
        // turn data into element
        let outerDiv = document.createElement('div');
        outerDiv.innerHTML = data;
        let message = outerDiv.firstElementChild

        // get sender id, numbers
        let senderId = parseInt(message.dataset.senderId)

        // get current_user id, numbers
        let currentUserId = parseInt(this.currentUserIdValue);

        // update message classes for incoming message
        if (senderId !== currentUserId){
          message.classList.remove("justify-content-end");
          message.classList.add("justify-content-start");

          message.firstElementChild.classList.remove("text-right");
          message.firstElementChild.classList.add("text-left");

          message.firstElementChild.parentNode.insertBefore(message.lastElementChild, message.firstElementChild);
        }

        // send the message
        this.messagesTarget.insertAdjacentElement("beforeend", message);
        message.scrollIntoView();


        if (senderId === currentUserId) {
          this.inputTarget.value = "";
        }
      }}
    )
    console.log(`Subscribed to the chatroom with the id ${this.chatroomIdValue}.`);
  }

  disconnect() {
    console.log("Unsubscribed from the chatroom")
    this.channel.unsubscribe()
  }
}
