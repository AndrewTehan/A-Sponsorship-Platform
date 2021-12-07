# frozen_string_literal: true

class RequirementsVocabulary < ApplicationRecord
  enum type: { project: 0, sponsor: 1 }
end
