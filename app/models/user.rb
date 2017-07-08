class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  # VALID_PASSWORD_REGEX = /\A(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{4,}\z/i

  has_one :location, dependent: :destroy
  has_one :address, dependent: :destroy
  accepts_nested_attributes_for :address

  has_many :user_events, dependent: :destroy
  has_many :events, through: :user_events
  has_many :litters, dependent: :nullify

  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    format: VALID_EMAIL_REGEX
  # validates :password_digest, format: VALID_PASSWORD_REGEX

  after_save :geocode          # auto-fetch coordinates

  def full_name
    "#{first_name} #{last_name}".titleize
  end

  private

  def geocode
    address = self.address.full_street_address
    result = Geocoder.search(address).first
    process_geocoded_result(result) if result
  end

  def process_geocoded_result(result)
    location = Location.new user_id: self.id  #create location and assign it to user that belongs to that address
    location.latitude = result.latitude
    location.longitude = result.longitude
    location.save
  end

end
