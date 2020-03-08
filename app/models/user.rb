class User < ApplicationRecord
    has_many :lists
    has_many :books, through: :lists


    has_secure_password
    validates :username, uniqueness: true
    validates :first_name, presence: {message: "Please enter your first name"}
    validates :last_name, presence: {message: "Please enter your surname"}
    validates :password_digest, presence: true

    before_save :make_list

    def make_list
        
        self.lists.create(:user => self, :name => "My Library", :desc => "This is my library") if new_record?
    
    end
end
