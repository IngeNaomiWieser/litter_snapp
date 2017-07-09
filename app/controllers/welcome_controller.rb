class WelcomeController < ApplicationController
  include ActionView::Helpers::AssetUrlHelper

  def index

  end

  def about
  end

  def map
    @user_location = current_user.location if user_signed_in?
    #have a function that checks if a user is logged in. If yes, it sets an instance variable to the location (lat and long) of the user.
    # then in your view file you will have to add the markers to the instance variable
    @litters = Litter.where(cleaned: false)
    @map_props = map_props
  end

  private

  def map_props
    {
      litters: litter_props(Litter.where(cleaned: false)),
      tab: 'index',
      user_location: current_user&.location,
      tab: 'index',
      planned_events: event_list(
        Event.where('planned_date >= ?', Date.today).order(planned_date: :asc).to_a
      ),
      past_events: event_list(
        Event.where('planned_date < ?', Date.today).order(planned_date: :desc).to_a
      )
    }
  end

  def event_list(events) #takes array of event objects
    events.map{|e| {
        id: e.id,
        planned_date: e.planned_date,
        planned_time: e.planned_time.strftime("%I:%M %p"),
        lat: e.location&.latitude,
        lng: e.location&.longitude,
        url: home_path,
        joined: e.users.count
      }
    }
  end

  def litter_props(litters)
    litters.map{|l| {
        id: l.id,
        lat: l.location.latitude,
        lng: l.location.longitude,
        img: l.image_url(:medium),
        amount: l.amount
      }
    }
  end

end
