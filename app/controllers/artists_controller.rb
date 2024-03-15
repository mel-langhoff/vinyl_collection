class ArtistsController < ApplicationController
  def index
    @artists = Artist.sort_alphabetically
  end
end