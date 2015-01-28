Rails.application.config.middleware.use OmniAuth::Builder do
  provider :spotify, ENV['SPOTIFY_APP_ID'], ENV['SPOTIFY_APP_SECRET'],
            scope: 'playlist-read-private user-read-private user-read-email user-library-read user-library-modify user-follow-read'
end
