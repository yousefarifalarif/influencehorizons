class Business < ApplicationRecord
  belongs_to :user
  has_many :campaigns, dependent: :destroy

  has_many :proposals, through: :campaign

  has_one_attached :photo

  validates :company_name, :company_url, presence: true
end
