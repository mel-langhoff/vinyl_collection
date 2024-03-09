class VinylsController < ApplicationController
  def index
    @vinyls = Vinyl.alphabetized_artists
  end

  def show
    @vinyl = Vinyl.find_by(params[:id])
  end
end