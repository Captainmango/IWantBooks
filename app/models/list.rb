class List < ApplicationRecord
    belongs_to :user
    has_many :comments
    has_many :books
    validates :name, presence: {message: "Please give your list a name"}
    validates :description, presence: true
    validates :user_id, presence: true
end
