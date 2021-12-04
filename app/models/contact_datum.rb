# frozen_string_literal: true

class ContactDatum < ApplicationRecord
  belong_to :user
end
