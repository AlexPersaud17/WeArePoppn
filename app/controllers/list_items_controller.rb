class ListItemsController < ApplicationController

  def create
    @party = Party.find(params[:party_id])
    @item = Item.find(params[:item_id])
    @party_item = PartyItem.find_by(party_id: @party.id, item_id: @item.id)
    binding.pry
  end

end
