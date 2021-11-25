class Influencer < ApplicationRecord
  belongs_to :user
  has_many :proposals
  has_many :reviews, through: :proposal
  # photo is a must
  validates :gender, presence: true, inclusion: { in: ['Male', 'Female', 'Others'] }
end
