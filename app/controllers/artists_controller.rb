class ArtistsController < ApplicationController
  def index
    @artists = Artist.alphabetical_list
  end
end