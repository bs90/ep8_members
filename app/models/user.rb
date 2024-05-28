# frozen_string_literal: true

class User < ApplicationRecord
  has_one_attached :avatar
  has_many :progoses, dependent: :destroy

  enum :original_role, {engineer: 0, brse: 1}
  enum :training_role, {be: 0, fe: 1, mobile: 2}
  enum :role, {admin: 0, user: 1}

  validates :name_roma, length: {maximum: Settings.user.max_length.name_roma}
  validates :name_kata, length: {maximum: Settings.user.max_length.name_kata}
  validates :email, length: {maximum: Settings.user.max_length.email},
                    presence: true, uniqueness: true,
                    format: {with: Settings.user.regex.email}
  validates :address, length: {maximum: Settings.user.max_length.address}
end
