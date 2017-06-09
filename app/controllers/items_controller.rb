class ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def create
  end

  private
  def item_params
    params.require(:item).permit(:name, :category)
  end
end
