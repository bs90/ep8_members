# frozen_string_literal: true

class User < ApplicationRecord
  has_one_attached :avatar
  has_many :progoses, dependent: :destroy
  has_many :tokens, dependent: :destroy

  enum :original_role, {engineer: 0, brse: 1}
  enum :training_role, {be: 0, fe: 1, mobile: 2}
  enum :role, {admin: 0, user: 1}
  before_commit :send_welcome_email, on: :create

  validates :name_roma, length: {maximum: Settings.user.max_length.name_roma}
  validates :name_kata, length: {maximum: Settings.user.max_length.name_kata}
  validates :email, length: {maximum: Settings.user.max_length.email},
                    presence: true, uniqueness: true,
                    format: {with: Settings.user.regex.email}
  validates :address, length: {maximum: Settings.user.max_length.address}

  def self.create_user_for_google data
    where(email: data["email"], provider: "google_oauth2").first_or_initialize.tap do |user|
      user.provider = "google_oauth2"
      user.email = data["email"]
      user.name_roma = data["name"]
      user.save!
    end
  end

  def send_welcome_email
    UserMailer.welcome_email(self).deliver_now
  end
end
