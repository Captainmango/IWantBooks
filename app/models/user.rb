class User < ApplicationRecord

  has_many :lists
  has_many :books, through: :lists

  validates :username, uniqueness: true
  validates :first_name, presence: {message: "Please enter your first name"}
  validates :last_name, presence: {message: "Please enter your surname"}
  validates :password_digest, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
