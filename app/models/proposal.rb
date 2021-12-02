class Proposal < ApplicationRecord
  belongs_to :campaign
  belongs_to :influencer, optional: true
  has_one :chatroom
  has_many :reviews, dependent: :destroy
  validates :title, :creator, presence: true

  after_commit :incoming_notifications, on: :create
  after_commit :update_notifications, on: :update

  private

  def incoming_notifications
    if creator == "Influencer"
      Notification.create(
        notify_type: 'incoming',
        actor: influencer.user,
        user: campaign.business.user,
        target: self,
        second_target: campaign
      )
    end
  end

  def update_notifications
    if status == "Pending" && creator == "Business"
      # Notification.create(
      #   notify_type: 'incoming',
      #   actor: campaign.business.user,
      #   user: influencer.user,
      #   target: self,
      #   second_target: campaign
      # )
    elsif status == "Declined" && accepted == false
      Notification.create(
        notify_type: 'declined',
        actor: creator == "Business" ? influencer.user : campaign.business.user,
        user: creator == "Business" ? campaign.business.user : influencer.user,
        target: self,
        second_target: campaign
      )
    elsif status == "In Progress" && accepted == true
      Notification.create(
        notify_type: 'accepted',
        actor: creator == "Business" ? influencer.user : campaign.business.user,
        user: creator == "Business" ? campaign.business.user : influencer.user,
        target: self,
        second_target: campaign
      )
    end
  end
end
