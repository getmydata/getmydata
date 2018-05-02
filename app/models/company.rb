class Company < ApplicationRecord
  acts_as_votable

  has_many :messages
  has_many :user_selections, dependent: :destroy
  has_many :users, through: :messages

  validates :name, presence: true
  validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i }
  validates :category, presence: true
  validates :url, presence: true, format: { with: /\A(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?\z/i }
  validates :name, uniqueness: true
  # validates :category, inclusion: { in: ["Living", "Energy", "News", "Bank", "Education"] }

  include PgSearch
  pg_search_scope :search_by_name_and_category,
  against: [:name, :category],
  using: {
    tsearch: { prefix: true }
  }

  scope :ranked, -> { order(cached_weighted_average: :desc) }

  mount_uploader :avatar, PhotoUploader
end
