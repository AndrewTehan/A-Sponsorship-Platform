# frozen_string_literal: true

class ProjectsSphere < ApplicationRecord
  belongs_to :sphere
  belongs_to :project
end
