class ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def create
    binding.pry
  end

  private
  def item_params
    params.require(:item).permit(:name)
  end
end
