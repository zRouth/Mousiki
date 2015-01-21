Rails.application.config.middleware.use OmniAuth::Builder do
  provider :spotify, '87623219a8154463ba31071932d5c101', '1c747e59974c4b9da1d851259c05788e',
            scope: 'playlist-read-private user-read-private user-read-email user-library-read user-library-modify user-follow-read'
end