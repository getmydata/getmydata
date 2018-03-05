class Company < ApplicationRecord
  has_many :reviews
  has_many :messages
  has_many :users, through: :messages

  validates :name, uniqueness: true
end
