class ListItemsController < ApplicationController

  def create
    @party = Party.find(params[:party_id])
    @item = Item.find(params[:item_id])
    @party_item = PartyItem.find_by(party_id: @party.id, item_id: @item.id)
    @guest = Guest.find_by(user: current_user, party: @party)
    list_item = ListItem.create(guest: @guest, party_item: @party_item)
    redirect_to @party
  end

end
