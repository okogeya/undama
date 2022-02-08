class EventsController < ApplicationController
  def index
    @event = Event.new
  end

  def create
    if @message.save
      redirect_to events_path
    else
      render :new
    end
  end

  private

  def message_params
    params.require(:message).permit(:title, :text, :happy_level_id, :public_id, :day).merge(user_id: current_user.id)
  end

end
