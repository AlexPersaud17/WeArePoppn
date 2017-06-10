class PartiesController < ApplicationController

  def show
    @party = Party.find(params[:id])
  end

  def new
    @party = Party.new
  end

  def create
    @party = current_user.hosted_parties.new(party_params)
    if @party.save
      @party.guests.create(party: @party, user: current_user)
      redirect_to new_party_item_path(@party)
    else
      @errors = @party.errors.full_messages
      render :new
    end
  end

  def destroy
    @party = Party.find_by(id: params[:id])
    @party.destroy
    redirect_to "/users/#{current_user.id}"
  end

  def edit
    @party = Party.find_by(id: params[:id])
  end

  def update
    @party = Party.find_by(id: params[:id])
    @party.update_attributes(party_params)
    if @party.save
      redirect_to "/parties/#{@party.id}"
    else
      @errors = @party.errors.full_messages
      render :edit
    end
  end

  private
  def party_params
    params.require(:party).permit(:name, :description, :location, :date)
  end
end
