class Address < ApplicationRecord
  belongs_to :user

  validates :postal_code, presence: true
  # validates :city, presence: true
  validates :country, presence: true

  geocoded_by :full_street_address   # can also be an IP address
  after_validation :geocode          # auto-fetch coordinates

  validates :postal_code, presence: true
  validates :city, presence: true
  validates :province, presence: true
  validates :country, presence: true

  def full_street_address
    [self.line_1, self.city, self.postal_code, self.province, self.country].reject(&:blank?).join(", ")
  end

  def geocode
    address = self.full_street_address
    result = Geocoder.search(address).first

    process_geocoded_result(result) if result
  end

  def process_geocoded_result(result)
    location = Location.new user_id: self.user.id  #create location and assign it to user that belongs to that address
    location.latitude = result.latitude
    location.longitude = result.longitude
    location.save
  end

end
