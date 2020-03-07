class List < ApplicationRecord
    has_many :books
    has_many :comments, through: :books
end
