# frozen_string_literal: true

class ProjectCondition < ApplicationRecord
  has_many :requirement_vocabularys
  belongs_to :project
end
