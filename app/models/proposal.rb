class Proposal < ApplicationRecord
  belongs_to :campaign
  belongs_to :influencer, optional: true
  has_one :chatroom
  has_many :reviews, dependent: :destroy
  validates :title, :creator, presence: true
end
