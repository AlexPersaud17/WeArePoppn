class UserMailer < ApplicationMailer
  default from: ENV["GMAIL_ADDRESS"]

  def welcome_email(user)
    @user = user
    @url = 'http://partyplanning.herokuapp.com/sessions/new'
    mail(to: @user.email, subject: "Welcome to Popp'n")
  end

  def invited_email(user, temp)
    @user = user
    @url = 'http://partyplanning.herokuapp.com/sessions/new'
    @password = temp
    mail(to: @user.email, subject: "You have been invited to Popp'n")
  end


end
