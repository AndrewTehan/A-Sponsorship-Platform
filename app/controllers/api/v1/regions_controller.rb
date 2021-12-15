module Api
  module V1
    class RegionsController < ApplicationController      
      def index
        @regions = Region.all

        render json: @regions
      end
    end
  end
end