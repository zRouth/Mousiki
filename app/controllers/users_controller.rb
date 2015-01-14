class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    #fetch tracks that a user has has saved in his library and
    # pull the corresponding artist


  end

end
