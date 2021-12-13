class RegionsController < ApplicationController
  def index
    @region = Region.all
    render json: @region
  end
end