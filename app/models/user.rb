class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  has_many :user_settings, dependent: :destroy
  has_many :projects, dependent: :destroy
  has_many :sponsor_proposals, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one :contact, dependent: :destroy

  enum role: { sponsor: 0, businessman: 1 }

  scope :sponsors, -> { where(role: 0) }
end
