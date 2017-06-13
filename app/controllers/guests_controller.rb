class GuestsController < ApplicationController
  def new
    @guest = Guest.new
    @party = Party.find_by(id: params[:party_id])
  end

  def create
    @party = Party.find_by(id: params[:party_id])
    @user = User.find_by(email: params[:email])
    if @user
      @guest = Guest.find_or_create_by(party: @party, user: @user)
      if request.xhr?
        render partial: "guest_added", locals: {party: @party, guest: @user}
      else
        redirect_to new_party_guest_path(@party)
      end
    else
      password = [*'a'..'z',*'A'..'Z',*'0'..'9'].sample(8).join("")
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
    @party = Party.find_by(id: params[:party_id])
    @user = User.find_by(id: params[:id])
    @guest = Guest.find_by(party: @party, user: @user)
    @guest.destroy
    if !request.xhr?
      redirect_to host?(@party) ?  @party : @user
    end
  end
end
