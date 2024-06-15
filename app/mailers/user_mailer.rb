# frozen_string_literal: true

class UserMailer < ApplicationMailer
  def welcome_email user
    @user = user
    mail(to: @user.email, subject: "Welcome to EP8 members")
  end
end
