class AlbumsController < ApplicationController
  def index
    @albums = Album.all
  end

  def search
    @search_results = Album.search(params[:search])
    render 'search_results'
  end
  
end