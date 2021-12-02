import { Controller } from "stimulus";
import consumer from "../channels/consumer";

export default class extends Controller {
  static values = { chatroomId: Number }
  static targets = ["input", "messages"]

  connect() {
    console.log(this.messagesTarget)
    console.log(this.inputTarget);

    this.channel = consumer.subscriptions.create(
      { channel: "ChatroomChannel", id: this.chatroomIdValue },
      { received: data => {
          this.messagesTarget.insertAdjacentHTML("beforeend", data);
          this.inputTarget.value = "";
        }
      }
    )
    console.log(`Subscribed to the chatroom with the id ${this.chatroomIdValue}.`);
  }

  disconnect() {
    console.log("Unsubscribed from the chatroom")
    this.channel.unsubscribe()
  }
}
