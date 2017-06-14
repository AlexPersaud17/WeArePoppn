class ItemsController < ApplicationController

  before_action :find_party, except: :show
  def new
    @item = Item.new
  end

  def show
    item = Item.find(params[:id])
    if item.category == "Food"
      @recipe = item.recipeAPI
    else
      render "./404"
    end

  end

  def create
    params[:item][:name].split(", ").each do |item|
      @item = @party.items.find_or_create_by(category: params[:item][:category], name: item.capitalize)
    end
    if request.xhr?
      render partial: "item_added", locals: {item: @item, party: @party}
    else
      redirect_to new_party_item_path(@party)
    end
  end

  def destroy
    @item = @party.items.find_by(id: params[:id])
    @party_item = PartyItem.find_by(party: @party, item: @item)
    @party_item.destroy
    if !request.xhr?
      redirect_to @party
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :category)
  end
end
