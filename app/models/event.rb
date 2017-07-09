class Event < ApplicationRecord

  has_one :location, dependent: :destroy
  has_many :user_events, dependent: :destroy
  has_many :users, through: :user_events

  def organizers
    self.user_events.where(is_organizer: true)
  end

end
