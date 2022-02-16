class UsersController < ApplicationController
  def show
    @name = current_user.name
    @events = current_user.events
    count_point
  end

  private

  def count_point
    daidaikichi = @events.where(happy_level_id: "2").count
    daikichi = @events.where(happy_level_id: "3").count
    kichi = @events.where(happy_level_id: "4").count
    @total = daidaikichi * 5 + daikichi * 3 + kichi * 1 
  end
end
