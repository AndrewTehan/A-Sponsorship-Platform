# frozen_string_literal: true

class RequirementsPhrase < ApplicationRecord
  enum purpose: { sponsor: 0, project: 1 }
end
