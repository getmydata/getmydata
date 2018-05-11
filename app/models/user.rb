class User < ApplicationRecord
  acts_as_voter

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

  after_create :set_default_avatar, only: [:create] #:send_welcome_email
  before_create { generate_token(:auth_token) }

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.password_reset(self).deliver
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

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
