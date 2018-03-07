class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :messages
  has_many :reviews
  has_many :companies, through: :messages
  has_many :companies
  # has_many :companies_reviewed, through: :reviews, foreign_key: "company_id", class_name: "Company"

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, uniqueness: true, presence: true

  mount_uploader :identification, IdentificationUploader
end
