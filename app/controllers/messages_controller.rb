class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
    @message.user = current_user
    @message.save!
    ChatroomChannel.broadcast_to(@message.chatroom, render_to_string(partial: "message_left", locals: { message: @message }))
  end

  private

  def message_params
    params.require(:message).permit(:chatroom_id, :content)
  end
end
