class ArtistsController < ApplicationController
  def show
    @artist_id = get_artist_id
    @calendar = get_artist_calendar
  end

  # pass the artist name to params
  # get artist id
  # use artist name to construct search query
  # get the artist id returned in the JSON query
  # get artist calendar
  # use artist id to construct a new calandar query for that artist
  # parse JSON
  # put calendar on show page

  private

  def get_artist_id
    response = Faraday.get(artist_request)
    body = JSON.parse(response.body)
    body['resultsPage']['results']['artist'].first['id']
  end

  def get_artist_calendar
    response = Faraday.get(calendar_request)
    body = JSON.parse(response.body)

    if body['resultsPage']['results'] == {}
      redirect_to root_path, notice: 'No upcoming shows for that artist'
    else
      body['resultsPage']['results']['event'].select do |event|
        event['performance'].first['artist']['id'] == @artist_id
      end
    end
  end

  def songkick
    'http://api.songkick.com/api/3.0/'
  end

  def songkick_api
    'apikey=Pk55qLCyIJJesrG6'
  end

  def artist_request
    songkick + "search/artists.json?query=#{params[:name]}&" + songkick_api
  end

  def calendar_request
    songkick + "artists/#{@artist_id}/calendar.json?" + songkick_api
  end

end
