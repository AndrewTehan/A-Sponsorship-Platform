# frozen_string_literal: true

class ProjectCondition < ApplicationRecord
  has_and_belongs_to_many :projects
end
