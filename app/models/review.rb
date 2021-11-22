class Review < ApplicationRecord
  belongs_to :proposal
  belongs_to :user

  validates :rating, :content, presence: true
end
