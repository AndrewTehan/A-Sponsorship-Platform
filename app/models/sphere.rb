# frozen_string_literal: true

class Sphere < ApplicationRecord
  has_and_belongs_to_many :projects

  enum sphere: { education: 0, media: 1, medical: 2, healthcare: 3, trade: 4, science: 5, culture: 6, industry: 7 }
end
