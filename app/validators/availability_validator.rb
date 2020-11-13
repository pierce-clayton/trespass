class AvailabilityValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)
    rentals = Rental.where(['listing_id = ?', record.listing_id])
    date_ranges = rentals.map do |rental|
      rental.start_date..rental.end_date
    end

    date_ranges.each do |date_range|
      record.errors.add(attribute, 'not available') if date_range.include?(value)
    end

  end

end