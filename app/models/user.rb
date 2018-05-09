class User < ApplicationRecord
  acts_as_voter

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable
  has_many :messages, dependent: :destroy
  has_many :user_selections, dependent: :destroy
  has_many :companies, through: :messages

  has_secure_token :auth_token

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, uniqueness: true, presence: true

  validates :agree_with_policy, presence: true

  mount_uploader :avatar, PhotoUploader

  after_create :set_default_avatar, #:send_welcome_email

  private

  def send_welcome_email
    UserMailer.welcome(self).deliver_now
  end

  def set_default_avatar
    if !self.avatar?
     self.avatar = Rails.root.join("app/assets/images/user.png").open
     self.save!
   end
 end
end
