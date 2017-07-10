class Event < ApplicationRecord

  has_one :location, dependent: :destroy
  has_one :address, dependent: :destroy
  has_many :user_events, dependent: :destroy
  has_many :users, through: :user_events

  accepts_nested_attributes_for :location

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
    process_result(result.address_components) if result.address_components
  end

  def process_result(result)
    self.address = Address.create(
      line_1: result[1] ? result[1]['long_name'] : 'Unknown Street',
      city: result[3] ? result[3]['long_name'] : 'Unknown City',
      postal_code: result[7] ? result[7]['long_name'] : 'H0H0H0',
      province: result[5] ? result[5]['long_name'] : 'BC',
      country: result[6] ? result[6]['long_name'] : 'Canada'
    )
  end
end
