class Address < ApplicationRecord
  belongs_to :user
  has_many :listings, dependent: :destroy
  has_many :rentals, through: :listings
  validates :propertyname, :add_l1, presence: true, uniqueness: true
  validates :city, :state, :zip, presence: true 
end
