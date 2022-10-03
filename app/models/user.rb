class User < ApplicationRecord
    # Name
    validates :name, presence: true, length: {maximum: 50}
    # Email
    before_save { self.email = email.downcase }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email, presence: true, uniqueness: true ,length: { maximum: 255 },
    format: { with: VALID_EMAIL_REGEX }
    #Password
    has_secure_password
    validates :password , length: { minimum: 6 }, presence: true
end
