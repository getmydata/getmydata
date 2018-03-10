class Company < ApplicationRecord
  acts_as_votable

  has_many :messages
  has_many :user_selections, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :users, through: :messages
  # has_many :users, through: :reviews > isn't possible to have both

  validates :name, presence: true
  validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i }
  validates :category, presence: true
  validates :url, presence: true, format: { with: /\A(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?\z/i }
  validates :name, uniqueness: true
  validates :category, inclusion: { in: ["Living", "Energy", "News", "Bank", "Education"] }

  include PgSearch
  pg_search_scope :search_by_name_and_category,
  against: [:name, :category],
  using: {
    tsearch: { prefix: true }
  }

  mount_uploader :avatar, PhotoUploader
end
