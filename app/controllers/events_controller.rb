class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  def show
    @event = Event.find params[:id]
    @user_event = @event.user_events.find_by(user: current_user)
  end

  def edit
    @event = Event.find params[:id]
  end

  def update
    event_params = params.require(:event).permit(:title, :planned_date, :planned_time, :notes)
    event = Event.find params[:id]
    if event.update event_params
      redirect_to event_path(@event), notice: "Your event was updated"
    else
      render :edit, alert: "Something went wrong..."
    end
  end

  def destroy
    event = Event.find params[:id]
    event.destroy
    redirect_to home_path, notice: "Your event was cancelled"
  end

end
