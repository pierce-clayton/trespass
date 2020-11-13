class EligibilityValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)
    listings = Listing.where(['address_id = ?', record.address.id])
    date_ranges = listings.map do |listing|
      listing.avail_start..listing.avail_end
    end

    date_ranges.each do |date_range|
      record.errors.add(attribute, 'not available') if date_range.include?(value)
    end

  end

end