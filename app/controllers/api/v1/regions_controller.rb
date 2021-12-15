# frozen_string_literal: true

module Api
  module V1
    # this is region controller
    class RegionsController < ApplicationController
      def index
        @regions = Region.all

        render json: @regions
      end
    end
  end
end
