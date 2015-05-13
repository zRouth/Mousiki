class ArtistsController < ApplicationController
  def show
    begin
      @calendar = SongkickEvents.new(params[:name]).artist_calendar
    rescue SongkickEvents::NoEventsFound => e
      redirect_to user_path(current_user), notice: e.msg
    end
  end

  # def create
  #   if CreateUser.new(params)
  #     render :success
  #   else
  #     render :failure
  #   end
  # end
end
