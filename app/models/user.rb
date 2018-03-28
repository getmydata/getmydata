class User < ApplicationRecord
  acts_as_voter

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable
  has_many :messages, dependent: :destroy
  has_many :user_selections, dependent: :destroy
  has_many :companies, through: :messages

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, uniqueness: true, presence: true

  validates :agree_with_policy, presence: true

  mount_uploader :identification, PhotoUploader
  mount_uploader :avatar, PhotoUploader

  after_create :set_default_avatar, :set_default_identification

  before_destroy :clean_s3

  private
  def clean_s3
    avatar.remove!
    avatar.thumb.remove! # if you have thumb version or any other version
  rescue Excon::Errors::Error => error
    puts "Something gone wrong"
    false
  end

  def set_default_avatar
    if !self.avatar?
     self.avatar = Rails.root.join("app/assets/images/user.png").open
     self.save!
   end
 end

 def set_default_identification
    if !self.identification?
     self.identification = Rails.root.join("app/assets/images/id-card.png").open
     self.save!
   end
 end

end
