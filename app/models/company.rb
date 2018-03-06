class Company < ApplicationRecord
  has_many :messages
  has_many :reviews
  has_many :users, through: :messages
  # has_many :users, through: :reviews > isn't possible to have both

  validates :name, presence: true
  validates :email, presence: true
  validates :url, presence: true
  validates :name, uniqueness: true
  # validates :category, inclusion: { in: ["living", "energy", "news", "bank", "education"] } > still have to decide whichs categories
end
