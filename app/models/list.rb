class List < ApplicationRecord
    belongs_to :user
    belongs_to :book

    validates :name, presence: {message: "Please give your list a name"}
    validates :desc, presence: true
    validates :user_id, presence: true
end
