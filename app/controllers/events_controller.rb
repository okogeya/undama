class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :list_events
  before_action :new_events, only: [:index, :new]
  before_action :set_events, only: [:show, :edit, :update, :destroy]

  def index
  end

  def new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to events_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @event.update(event_params)
      redirect_to event_path(@event.id)
    else
      render :edit
    end
  end

  def destroy
    @event.destroy
  end

  private

  def event_params
    params.require(:event).permit(:title, :text, :happy_level_id, :public_id, :day).merge(user_id: current_user.id)
  end

  def list_events
    @events = Event.all
  end

  def new_events
    @event = Event.new
  end

  def set_events
    @event = Event.find(params[:id])
  end

end
