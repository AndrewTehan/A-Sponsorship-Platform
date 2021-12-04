# frozen_string_literal: true

class User < ApplicationRecord
  has_many :user_settings
  has_one :contact

  enum status: { sponsor: 0, industrialist: 1 }
end
