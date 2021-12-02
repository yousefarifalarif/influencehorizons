class Message < ApplicationRecord
  belongs_to :chatroom
  belongs_to :user

  after_commit :incoming_notifications, on: :create

  def incoming_notifications
    Notification.create(
      notify_type: 'message',
      actor: user,
      user: user.role == "Influencer" ? chatroom.proposal.campaign.business.user : chatroom.proposal.influencer.user,
      target: self,
      second_target: chatroom.proposal
    )
  end
end
