class VinylsController < ApplicationController
  def index
    @vinyls = Vinyl.all.order(:last_name).distinct
  end

  def show
    @vinyl = Vinyl.find_by(last_name: params[:last_name])
  end
end