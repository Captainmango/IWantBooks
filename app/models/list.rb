class List < ApplicationRecord
    belongs_to :books
    belongs_to :user
    has_many :comments
end
