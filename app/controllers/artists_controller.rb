class ArtistsController < ApplicationController
  def index
    @artists = Artist.sort_alphabetically
  end

  def show
    @artist = Artist.find(params[:id])
  end

  def search
    @search_results = Artist.search(params[:search])
    render 'search_results'
  end
end