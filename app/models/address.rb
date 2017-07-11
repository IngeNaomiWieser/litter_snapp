class Address < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :event, optional: true

  geocoded_by :full_street_address   # can also be an IP address

  validates :postal_code, presence: true
  validates :city, presence: true
  validates :province, presence: true
  validates :country, presence: true

  def full_street_address
    [self.line_1, self.city, self.postal_code, self.province, self.country].reject(&:blank?).join(", ")
  end

  def street_address
    [self.line_1, self.city].reject(&:blank?).join(", ")
  end

end
