class Verification < ApplicationRecord
    belongs_to :user
    has_one_attached :image

    validates :user, presence: true
    validates :card_type, presence: true
    validates :card_num, presence: true
    validates :image, presence: true
end
