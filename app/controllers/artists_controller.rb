class ArtistsController < ApplicationController

  def show
    @artist_id = get_artist_id
    binding.pry
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
    "mbid:" + body["resultsPage"]["results"]["artist"].first["identifier"].first["mbid"]
  end

  def get_artist_calendar

    request = "http://api.songkick.com/api/3.0/artists/#{@artist_id}/calendar.json?apikey=Pk55qLCyIJJesrG6"

  end

end


