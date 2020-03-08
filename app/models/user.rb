class User < ApplicationRecord

  has_many :comments
  has_many :books, through: :comments

  validates :email, uniqueness: true
  # validates :first_name, presence: {message: "Please enter your first name"}
  # validates :last_name, presence: {message: "Please enter your surname"}
  validates :encrypted_password, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :validatable
end
