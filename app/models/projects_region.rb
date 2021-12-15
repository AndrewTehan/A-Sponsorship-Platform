# frozen_string_literal: true

class ProjectsRegion < ApplicationRecord
  belongs_to :region
  belongs_to :project
end
