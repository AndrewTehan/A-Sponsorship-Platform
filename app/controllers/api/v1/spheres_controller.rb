module Api
  module V1
    class SpheresController < ApplicationController      
      def index
        @spheres = Sphere.all

        render json: @spheres
      end
    end
  end
end