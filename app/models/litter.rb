class Litter < ApplicationRecord
  belongs_to :user
  has_one :location, dependent: :destroy
  has_many :event_litters, dependent: :destroy
  has_many :events, through: :event_litters

  mount_uploader :image, ImageUploader

  validates :amount, presence: true
  validates_processing_of :image
  # validate :image_size_validation

  # private
  #   def image_size_validation
  #     errors[:image] << "should be less than 500KB" if image.size > 0.5.megabytes
  #   end

end
