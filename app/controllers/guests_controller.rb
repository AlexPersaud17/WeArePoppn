class GuestsController < ApplicationController
  def new
    @guest = Guest.new
    @party = Party.find_by(id: params[:party_id])
  end

  def create
    @party = Party.find_by(id: params[:party_id])
    @user = User.find_by(email: params[:email])
    if @user
      Guest.find_or_create_by(party: @party, user: @user)
      redirect_to new_party_guest_path(@party)
    else
      @errors = ["Sorry, we can't find a user by the email '#{params[:email]}'"]
      render "new"
    end
  end

  def destroy
    @party = Party.find_by(id: params[:party_id])
    @user = User.find_by(id: params[:id])
    @guest = Guest.find_by(party: @party, user: @user)
    @guest.destroy
    redirect_to host?(@party) ?  @party : @user
  end
end
