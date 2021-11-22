class Business < ApplicationRecord
  belongs_to :user
  has_many :campaigns

  has_many :proposals, through: :campaign
  has_many :proposals, through: :campaign

  validates :company_name, presence: true
end
