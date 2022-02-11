class EventsController < ApplicationController
  def index
    @events = Event.all
    @event = Event.new
  end

  def new
    @events = Event.all
    @event = Event.new
  end

  def create
    @events = Event.all
    @event = Event.new(event_params)
    if @event.save
      redirect_to events_path
    else
      render :new
    end
  end

  def show
    @events = Event.all
    @event = Event.find(params[:id])
  end

  private

  def event_params
    params.require(:event).permit(:title, :text, :happy_level_id, :public_id, :day).merge(user_id: current_user.id)
  end

end
