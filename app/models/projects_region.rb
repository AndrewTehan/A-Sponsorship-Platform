class ProjectsRegion < ApplicationRecord
  belongs_to :region
  belongs_to :project
end
