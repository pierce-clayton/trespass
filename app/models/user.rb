class User < ApplicationRecord
  has_secure_password
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true
  has_many :addresses
  has_many :listings, through: :addresses
  has_many :rentals
  has_many :comments



  
end
