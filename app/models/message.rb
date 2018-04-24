class Message < ApplicationRecord
  belongs_to :user
  belongs_to :company

  validates :subject, presence: true
  validates :text, presence: true

  mount_uploader :attachment, PhotoUploader

  scope :ordered, -> { order(:company_id) }
end
