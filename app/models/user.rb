class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :messages
  has_many :user_selections, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :companies, through: :messages
  # has_many :companies_reviewed, through: :reviews, foreign_key: "company_id", class_name: "Company"

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, uniqueness: true, presence: true

  mount_uploader :identification, PhotoUploader
  mount_uploader :avatar, PhotoUploader
end
