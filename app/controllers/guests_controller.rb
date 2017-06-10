class GuestsController < ApplicationController
  def new
    @guest = Guest.new
    @party = Party.find_by(id: params[:party_id])
  end

  def create
    @party = Party.find_by(id: params[:party_id])
    binding.pry

  end
end
