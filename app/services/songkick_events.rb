class SongkickEvents

  class NoEventsFound < RuntimeError; end

  def initialize(name)
    @name = name
  end

  def artist_calendar
    get_artist_calendar
  end

  private

  def get_artist_id
    @artist_id ||= begin
      response = Faraday.get(artist_request)
      body = JSON.parse(response.body)
      if body['resultsPage']['results']['artist']
        body['resultsPage']['results']['artist'].first['id']
      end
    end
  end

  def get_artist_calendar
    response = Faraday.get(calendar_request)
    body = JSON.parse(response.body)

    if body['resultsPage']['results'] == {} || !body['resultsPage']['results']
      raise NoEventsFound.new('No upcoming shows for that artist')
    else
      body['resultsPage']['results']['event'].select do |event|
        event['performance'].first['artist']['id'] == get_artist_id
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
    songkick + "search/artists.json?query=#{@name}&" + songkick_api
  end

  def calendar_request
    songkick + "artists/#{get_artist_id}/calendar.json?" + songkick_api
  end

end