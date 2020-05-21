class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :comments, -> { order(created_at: :asc) }, dependent: :destroy
  before_validation { 
    self.category ||= Category.first 
    self.views ||= 0
  }
  validates :user, presence: true
  validates :category, presence: true
  validates :content, presence: true, length: { maximum: 10000 } 
end
