class ArtistsController < ApplicationController
  def index
    @artists = Artist.sort_alphabetically
  end

  def show
    @artist = Artist.find(params[:id])
  end
end