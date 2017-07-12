FactoryGirl.define do
  factory :user_events do
    is_organizer false
    user nil
    event nil
  end
end
