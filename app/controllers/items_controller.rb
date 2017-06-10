class ItemsController < ApplicationController
  def new
    @item = Item.new
    @party = Party.find_by(id: params[:party_id])
  end

  def create
    @party = Party.find_by(id: params[:party_id])
    params[:item][:name].split(", ").each do |item|
      @item = @party.items.find_or_create_by(category: params[:item][:category], name: item)
    end
    redirect_to new_party_item_path(@party)
  end

  def destroy
    @party = Party.find_by(id: params[:party_id])
    @item = @party.items.find_by(id: params[:id])
    @party_item = PartyItem.find_by(party: @party, item: @item)
    @party_item.destroy
    redirect_to @party
  end

  private
  def item_params
    params.require(:item).permit(:name, :category)
  end
end
