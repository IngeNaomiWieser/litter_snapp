class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :find_event

  def show
    @user_event = @event.user_events.find_by(user: current_user)
  end

  def edit

  end

  def update
    event_params = params.require(:event).permit(:title, :planned_date, :planned_time, :notes)
    if !(can? :update, @event)
      redirect_to event_path(@event), alert: "You are not allowed to change this event."
    elsif @event.update(event_params)
      redirect_to event_path(@event), notice: "Your event was updated"
    else
      render :edit, alert: "Something went wrong..."
    end
  end

  def destroy
    if can? :destroy, @event
      @event.destroy
      redirect_to home_path, notice: "Your event was cancelled"
    else
      redirect to event_path(@event), alert: "You are not allowed to cancel this event"
    end
  end

  private

  def find_event
    @event = Event.find params[:id]
  end

end
