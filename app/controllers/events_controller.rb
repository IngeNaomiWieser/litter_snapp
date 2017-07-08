class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def show
    @event = Event.find params[:id]
    @user_event = @event.user_events.find_by(user: current_user)
  end

  def new
    @event = Event.new
  end

  def create
    event = Event.new event_params
    if event.save
      UserEvent.create(user_id: current_user.id, event_id: event.id, is_organizer: true)
      redirect_to map_path, notice: "You're AWESOME! Thanks for organizing an event"
    else
      redirect_to map_path
    end
  end

  private

  def event_params
    params.require(:event).permit(
      :planned_time,
      :planned_date,
    )
  end
end
