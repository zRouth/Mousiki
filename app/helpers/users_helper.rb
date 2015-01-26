module UsersHelper
  class Client
    def me_tracks
      run(:get, '/v1/me/tracks', [200])
    end
  end
end
