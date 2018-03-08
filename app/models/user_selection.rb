class UserSelection < ApplicationRecord
  belongs_to :user
  belongs_to :company

  validates :user_id, presence: true
  validates :company_id, presence: true
  validates_uniqueness_of :user_id, :scope => [:company_id]
end
