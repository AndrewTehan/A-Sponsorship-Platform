# frozen_string_literal: true

class ProjectCondition < ApplicationRecord
  has_many :requirements_phrases
  belongs_to :project
end
