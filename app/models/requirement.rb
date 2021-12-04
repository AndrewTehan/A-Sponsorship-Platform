# frozen_string_literal: true

class Requirement < ApplicationRecord
  belong_to :user_setting
  belong_to :project_condition
  belong_to :sponsor_condition

  enum type: { project: 0, sponsor: 1 }
end
