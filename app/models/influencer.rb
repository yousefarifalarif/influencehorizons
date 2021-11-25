class Influencer < ApplicationRecord
  belongs_to :user
  has_many :proposals
  has_many :reviews, through: :proposal

  has_one_attached :photo

  validates :gender, presence: true, inclusion: { in: ['Male', 'Female', 'Others'] }
end
