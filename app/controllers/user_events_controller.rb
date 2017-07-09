class UserEventsController < ApplicationController
  before_action :authenticate_user!

  def create
    user_event = current_user.user_events.new
    event = Event.find params[:event_id]
    user_event.event = event
    if user_event.save
      redirect_to event, notice: 'You joined this event!'
    else
      redirect_to event, alert: "Sorry, you can not join this event. Did you already join it?"
    end
  end

  def destroy
    event = Event.find params[:event_id]
    user_event = current_user.user_events.find params[:id]
    if can? :destroy, user_event
      user_event.destroy
      redirect_to event, notice: 'You successfully cancelled your participation for this event.'
    else
      redirect_to event, alert: "As the organizer you cannot bail from your own event."
    end
  end


end
