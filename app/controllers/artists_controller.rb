class ArtistsController < ApplicationController

  def show
    @artist_id = get_artist_id
    @calendar = get_artist_calendar
    # get_calendar_performance
    # get_calendar_venue
    # get_calendar_location
    # get_calendar_display_name_and_date

  end

#pass the artist name to params
#get artist id
  #use artist name to construct search query
  #get the artist id returned in the JSON query
#get artist calendar
  #use artist id to construct a new calandar query for that artist
  #parse JSON
  #put calendar on show page

  private

  def get_artist_id
    request = "http://api.songkick.com/api/3.0/search/artists.json?query=#{params[:name]}&apikey=Pk55qLCyIJJesrG6"
    response = Faraday.get(request)
    body = JSON.parse(response.body)
    #this will bloow up if the results page is empty!!!
    #extract object :)
    body["resultsPage"]["results"]["artist"].first["id"]
  end

   def get_artist_calendar
    request = "http://api.songkick.com/api/3.0/artists/#{@artist_id}/calendar.json?apikey=Pk55qLCyIJJesrG6"
    response = Faraday.get(request)
    body = JSON.parse(response.body)
    body["resultsPage"]["results"]["event"].select do |event|
      event["performance"].first["artist"]["id"] == @artist_id
    end
  end

  # def us_tour_dates_only
  #   body["resultsPage"]["results"]["event"]["venue"]["metroArea"]["country"]["displayName"]
  # end

  # def get_calendar_performance
  #   @calendar["performance"]
  # end

  # def get_calendar_venue
  #   @calendar["venue"]
  # end

  # def get_calendar_location
  #   @calendar["location"]
  # end

  # def get_calendar_display_name_and_date
  #   @calendar["displayName"]
  # end

end


