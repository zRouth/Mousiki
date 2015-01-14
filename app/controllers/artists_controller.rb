class ArtistsController < ApplicationController

  def index
    @artists = Artists.all
  end

end
