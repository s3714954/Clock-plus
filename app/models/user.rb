class User < ApplicationRecord
    attr_accessor :remember_token
    before_save { 
        self.email = email.downcase
        self.name ||= self.email.split('@').first # default name
    }
    #validates :name, presence: true, length: { maximum: 50 } # username deprecated
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 },
                                      format: { with: VALID_EMAIL_REGEX }, 
                                      uniqueness: { case_sensitive: false }
    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
    VALID_MOBILE_NUMBER_REGEX = /\+?[\d+-]*\d+/i
    validates :mobile_number, presence: true, length: { minimum: 8, maximum: 20 },
                                    format: { with: VALID_MOBILE_NUMBER_REGEX }

    has_many :posts, -> { order(created_at: :desc) }, dependent: :destroy
    has_many :comments, -> { order(created_at: :desc) }, dependent: :destroy

    # Returns the hash digest of the given string.
    def User.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                      BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end

    # Returns a random token.
    def User.new_token
        SecureRandom.urlsafe_base64
    end

    def remember
        self.remember_token = User.new_token
        update_attribute(:remember_digest, User.digest(remember_token))
    end

    # Returns true if the given token matches the digest
    def authenticated?(remember_token)
        return false if remember_digest.nil?
        BCrypt::Password.new(remember_digest).is_password?(remember_token)
    end

    # Forgets a user.
    def forget
        update_attribute(:remember_digest, nil)
    end

end
