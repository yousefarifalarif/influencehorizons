class Campaign < ApplicationRecord
  belongs_to :business
  has_many :proposals, dependent: :destroy
  validates :name, :location, :start_date, :end_date, :description, :budget, presence: true
end
