class Location < ApplicationRecord
  belongs_to :litter, optional: true
  belongs_to :user, optional: true
  belongs_to :event, optional: true
end
