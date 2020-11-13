class User < ApplicationRecord
  has_secure_password
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true
  has_many :addresses, dependent: :destroy
  has_many :listings, dependent: :destroy, through: :addresses
  has_many :rentals
  has_many :comments, dependent: :destroy



  
end
