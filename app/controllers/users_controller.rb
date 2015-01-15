class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @client = client(@user)
  end

  private

  def client(user)
   Spotify::Client.new(access(user.token))
  end

  def access(token)
    {
    :access_token => token,
    :raise_errors => true,  # choose between returning false or raising a proper exception when API calls fails

    # Connection properties
    :retries       => 0,    # automatically retry a certain number of times before returning
    :read_timeout  => 10,   # set longer read_timeout, default is 10 seconds
    :write_timeout => 10,   # set longer write_timeout, default is 10 seconds
    :persistent    => false # when true, make multiple requests calls using a single persistent connection. Use +close_connection+ method on the client to manually clean up sockets
  }
  end

end