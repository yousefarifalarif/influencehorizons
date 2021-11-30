class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
    @message.user = current_user
    @message.save!
    if current_user.role == "Business"
      redirect_to campaign_path(@message.chatroom.proposal.campaign, anchor: "message-#{@message.id}")
    else
      redirect_to proposals_path(anchor: "message-#{@message.id}")
    end
  end

  private

  def message_params
    params.require(:message).permit(:chatroom_id, :content)
  end
end
