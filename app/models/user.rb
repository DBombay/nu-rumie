class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :age, presence: true
  validates :email,
    presence: true,
    uniqueness: true,
    format: { with: /\A((\w+)|(\.))+\@[a-z]+\.[a-z]{3}\z/ }
  validates :password, presence: true, on: :create
  validates :password_confirmation, presence: true, on: :create
  validates :role, presence: true, inclusion: { in: ["admin", "moderator", "renter", "landlord"] }
  validates :city, presence: true
  validates :state, presence: true

  mount_uploader :avatar, AvatarUploader

  def admin?
    self.role == "admin"
  end
end
