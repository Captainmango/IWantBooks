class Comment < ApplicationRecord
    belongs_to :list
    belongs_to :user
    validates :content, presence: true
    validates :list_id, presence: true
end
