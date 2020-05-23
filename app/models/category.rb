class Category < ApplicationRecord
    has_many :posts, -> { order(created_at: :desc) }
    validates :name, presence: true
end
