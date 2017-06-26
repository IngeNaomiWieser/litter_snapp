class Event < ApplicationRecord

  has_many :joins, dependent: :destroy
  has_many :joiners, through: :joins, source: :user

end
