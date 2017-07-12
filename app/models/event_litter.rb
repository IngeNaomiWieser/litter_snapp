class EventLitter < ApplicationRecord
  belongs_to :litter
  belongs_to :event

  validates :litter_id, uniqueness: { scope: :event_id }
# rails g migration CreateEventLittersTable event:references, litter:references
end
