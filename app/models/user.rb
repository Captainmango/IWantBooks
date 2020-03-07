class User < ApplicationRecord
    has_many :books
    has_many :books, through: :lists
    has_secure_password
    validates :username, uniqueness: true
    validates :first_name, presence: {message: "Please enter your first name"}
    validates :last_name, presence: {message: "Please enter your surname"}
end
