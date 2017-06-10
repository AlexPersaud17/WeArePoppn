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
      redirect_to new_party_item_path(@party)
    else
      @errors = @party.errors.full_messages
      render :new
    end
  end

  private
  def party_params
    params.require(:party).permit(:name, :description, :location, :date)
  end

end
