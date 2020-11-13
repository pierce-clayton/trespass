class Rental < ApplicationRecord
  belongs_to :user
  belongs_to :listing
  validates :start_date, :end_date, presence: true, availability: true
  validates :souls, :vehicles, presence: true
  validates_numericality_of :souls, on: :create, message: "is not a number"
  validate :end_date_after_start_date, :start_date_after_avail_start, :end_date_before_avail_end

  private

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?

    errors.add(:end_date, 'must be after the start date') if end_date < start_date
  end

  def start_date_after_avail_start
    return if end_date.blank? || start_date.blank?
    
    errors.add(:start_date, 'must be after avialability begins') if start_date < listing.avail_start
  end

  def end_date_before_avail_end
    return if end_date.blank? || start_date.blank?
    
    errors.add(:end_date, 'must be before avialability ends') if end_date > listing.avail_end
  end
end
