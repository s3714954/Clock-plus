class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :comments, -> { order(created_at: :asc) }, dependent: :destroy
  before_validation { category ||= Category.first }
end
