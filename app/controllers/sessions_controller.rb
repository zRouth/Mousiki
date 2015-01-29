class SessionsController < ApplicationController
  def new
    redirect_to '/auth/spotify'
  end

  def create
    @user = User.find_or_create_from_auth_hash(auth_hash)
    reset_session
    session[:user_id] = @user.id
    redirect_to user_path(@user), notice: 'You have succesfully loged in with spotify!'
  end

  def destroy
    reset_session
    redirect_to root_path, notice: 'Signed out!'
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
