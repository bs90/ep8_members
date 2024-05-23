class User < ApplicationRecord
    VALID_EMAIL_REGEX = ^[\w-\.]+@sun-asterisk.com
    validates :name_roma, length:{maximum: 30}, presence: true
    validates :name_kata, length:{maximum: 50}, presence: true
    validates :email, length:{maximum: 255}, 
                      presence: true, uniqueness: true, 
                      format: { with: VALID_EMAIL_REGEX, message: "The email does not belong to Sun Asterisk" }
    validates :address, length:{maximum: 255}

    enum :original_role, {Engineer: 0, BrSE: 1}
    enum :training_role, {BE: 0, FE: 1, Mobile: 2}
    enum :role, {admin: 0, user: 1}

    has_one_attached :avatar
    validates :avatar, presence: false, attached: true, content_type: ['image/png', 'image/jpg', 'image/jpeg'],
    size: { less_than: 5.megabytes,
            message: 'Avatar must be less than 5MB.' }
end
