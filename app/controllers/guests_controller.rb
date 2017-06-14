class GuestsController < ApplicationController
  before_action :find_party
  
  def new
    @guest = Guest.new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user
      @guest = Guest.find_or_create_by(party: @party, user: @user)
      if request.xhr?
        render partial: "guest_added", locals: {party: @party, guest: @user}
      else
        redirect_to new_party_guest_path(@party)
      end
    else
      password = temp_password
      @user = User.create(first_name:"temp", last_name: "temp", email: params[:email], password: password)
      @guest = Guest.find_or_create_by(party: @party, user: @user)
      UserMailer.invited_email(@user, password).deliver!
      if request.xhr?
        render partial: "guest_added", locals: {party: @party, guest: @user}
      else
        @errors = ["Sorry, we can't find a user by the email '#{params[:email]}'"]
        render "new"
      end
    end
  end

  def destroy
    @user = User.find_by(id: params[:id])
    @guest = Guest.find_by(party: @party, user: @user)
    @guest.destroy
    if !request.xhr?
      redirect_to host?(@party) ?  @party : @user
    end
  end

  private

  def temp_password
    [*'a'..'z',*'A'..'Z',*'0'..'9'].sample(8).join("")
  end

end
