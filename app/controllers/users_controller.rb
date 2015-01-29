module Spotify
  class Client
    def me_tracks
      run(:get, '/v1/me/tracks', [200])
    end
  end
end

class UsersController < ApplicationController
  protect_from_forgery with: :null_session

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @client = client(@user)
    @artists = artist_name.uniq
  end

  private

  def client(user)
    Spotify::Client.new(access(user.token))
  end

  def access(token)
    {
      access_token: token,
      raise_errors: true,
      retries: 0,
      read_timeout: 10,
      write_timeout: 10,
      persistent: false
    }
  end

  def artist_name
    @client.me_tracks['items'].map { |item| item['track']['artists'].first['name'] }
  end
end
