class ListItemsController < ApplicationController

  before_action :find_party_item_and_guest

  def create
    @party = Party.find(params[:party_id])
    @item = Item.find(params[:item_id])
    @party_item = PartyItem.find_by(party_id: @party.id, item_id: @item.id)
    @guest = Guest.find_by(user: current_user, party: @party)
    @list_item = ListItem.find_or_create_by(guest: @guest, party_item: @party_item)
    if request.xhr?
      render partial: "list_item_added", locals:{item: @item, party: @party, list_item: @list_item}
    else
      redirect_to @party
    end
  end


  def destroy
    list_item = ListItem.find_by(guest: @guest, party_item: @party_item)
    list_item.destroy
    if request.xhr?
      if @guest.list_items.empty?
        if request.referer.include?("parties")
          render partial: "list_item_added", locals: {item: @item, party: @party, list_item: @list_item}
        else
          render partial: "./guests/empty_list"
        end
      end
    else
      redirect_to current_user
    end
  end

  private
  def find_party_item_and_guest
    find_party
    @item = Item.find(params[:item_id])
    @party_item = PartyItem.find_by(party_id: @party.id, item_id: @item.id)
    @guest = Guest.find_by(user: current_user, party: @party)
  end

end
