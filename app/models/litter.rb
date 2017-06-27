class Litter < ApplicationRecord
  belongs_to :user
  has_one :location, dependent: :destroy
end
