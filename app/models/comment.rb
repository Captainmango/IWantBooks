class Comment < ApplicationRecord
    belongs_to :list
    belongs_to :book
end
