class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_settings
  has_many :projects
  has_many :sponsor_proposals
  has_many :comments, dependent: :destroy
  has_one :contact
  
  enum role: { sponsor: 0, businessman: 1 }
end
