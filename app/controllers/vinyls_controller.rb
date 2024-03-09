class VinylsController < ApplicationController
  def index
    @vinyls = Vinyl.alphabetized_artists
  end

  def show
    @vinyl = Vinyl.find_by(last_name: params[:last_name])
  end
end