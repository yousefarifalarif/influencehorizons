class Chatroom < ApplicationRecord
  belongs_to :proposal
  has_many :messages
end
