class UserMailer < ApplicationMailer
  default from: 'theasteve17@gmail.com'

  def welcome_email(user)
    @user = user
    @url = 'http://localhost:3000/login'
    mail(to: @user.email, subject: "Welcome to Popp'n")
  end

  def invited_email(user)
    @user = user
    @url = 'http://localhost:3000/login'
    mail(to: @user.email, subject: "You have been invited to Popp'n")
  end
end
