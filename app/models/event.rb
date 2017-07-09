class Event < ApplicationRecord

  has_one :location, dependent: :destroy
  has_one :address, dependent: :destroy
  has_many :user_events, dependent: :destroy
  has_many :users, through: :user_events

  def organizers
    self.user_events.where(is_organizer: true)
  end

  before_save :reverse_geocode, if: 'can_reverse_geocode?'  # auto-fetch address

  private
  def can_reverse_geocode?
    self.location.latitude.present? && self.location.longitude.present? && !self.address
  end

  def reverse_geocode
    latlng = "#{self.location.latitude},#{self.location.longitude}"
    result = Geocoder.search(latlng).first
    process_result(result) if result
  end

  def process_result(result)
    self.address = Address.create(
      line_1: result.address_components[1]['long_name'],
      city: result.address_components[3]['long_name'],
      postal_code: result.address_components[7]['long_name'],
      province: result.address_components[5]['long_name'],
      country: result.address_components[6]['long_name']
    )
  end
end
