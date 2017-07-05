class EventsController < ApplicationController

  def show
    @event = Event.find params[:id]
    @user_event = @event.user_events.find_by(user: current_user)
  end

end
