class SessionsController < ApplicationController

  def new
    @user = User.new
  end

 def create
    @user = User.where(authhash: authhash).first_or_create
    self.current_user = @user
    redirect_to '/'
  end

  protected

  def authhash
    request.env['omniauth.auth']
  end
end
