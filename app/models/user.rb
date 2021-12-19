# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :projects
  has_many :sponsor_proposals
  has_many :user_settings
  has_many :comments, dependent: :destroy
  has_one :contact

  enum role: { sponsor: 0, industrialist: 1 }
end
