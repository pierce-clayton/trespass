class Listing < ApplicationRecord
  belongs_to :address
  has_many :rentals
  has_many :comments

  validates :price, :avail_start, :avail_end, presence: true, eligibility: true
  validates :description, :allowed_activities, presence: true
  validate :end_date_after_start_date

  private

  def end_date_after_start_date
    return if avail_end.blank? || avail_start.blank?

    errors.add(:avail_end, 'must be after the start date') if avail_end < avail_start
  end
end
