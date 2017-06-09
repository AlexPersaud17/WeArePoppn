class PartiesController < ApplicationController
  def new
    @party = Party.new
  end

  def create
    @party = current_user.parties.new(party_params)
    if @party.save
      redirect_to new_item_path
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
