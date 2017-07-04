class WelcomeController < ApplicationController
  def index

  end

  def about
  end

  def map
    @user_location = current_user.location if user_signed_in?
    #have a function that checks if a user is logged in. If yes, it sets an instance variable to the location (lat and long) of the user.
    # then in your view file you will have to add the markers to the instance variable
    @litters = Litter.where(cleaned: false)
    @props = props
  end

  private

  def props
    {
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
        url: home_path,
        joined: e.users.count
      }
    }
  end
end
