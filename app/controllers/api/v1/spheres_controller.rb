# frozen_string_literal: true

module Api
  module V1
    # this is sphere controller
    class SpheresController < ApplicationController
      def index
        @spheres = Sphere.all

        render json: @spheres
      end
    end
  end
end
