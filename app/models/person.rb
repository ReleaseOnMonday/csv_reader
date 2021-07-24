class Person < ApplicationRecord
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    VALID_PHONE_REGEX = /\A([+]?\d{6,15}?|)\z/
    MESSAGE = "entry is invalid"

    validates :first_name, :last_name, presence: true
    validates :email,
    format: { with: VALID_EMAIL_REGEX, message: MESSAGE }
    validates :phone,
    format: { with: VALID_PHONE_REGEX, message: MESSAGE }
end
