# frozen_string_literal: true

class Grading < ApplicationRecord
  belongs_to :user
  belongs_to :project
end
