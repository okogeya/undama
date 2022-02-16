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
    if @event.public.name == "公開"
      @event = Event.find(params[:id])
    elsif @event.public.name == "非公開" && user_signed_in? && current_user.id == @event.user_id
      @event = Event.find(params[:id])
    else
      redirect_to root_path
    end
  end

  def edit
    redirect_to root_path unless current_user.id == @event.user_id
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
    redirect_to root_path
  end

  def search
    @events = Event.search(params[:keyword])
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
