class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :business, dependent: :destroy
  has_one :influencer, dependent: :destroy
  has_many :proposals

  validates :phone_number, :first_name, :last_name, :location, presence: true
  validates :role, presence: true, inclusion: { in: %w[Business Influencer] }
end
