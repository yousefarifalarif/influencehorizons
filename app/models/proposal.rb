class Proposal < ApplicationRecord
  belongs_to :campaign
  belongs_to :influencer
  belongs_to :user
end
