class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :listing, dependent: :destroy
  validates :description, presence: true
end
