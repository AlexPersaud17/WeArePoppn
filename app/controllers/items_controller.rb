class ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def show
    item = Item.find(params[:id])
    if item.category == "food"
      query = item.name.gsub(' ', '%20')
      search_uri = URI.parse("http://food2fork.com/api/search?key=88f3ebacdda487a8f189e14742f852cd&q=#{query}")
      search_response = Net::HTTP.get_response(search_uri)
      search_results = JSON.parse(search_response.body)
      recipe = search_results["recipes"][0]

      recipe_uri = URI.parse("http://food2fork.com/api/get?key=88f3ebacdda487a8f189e14742f852cd&rId=#{recipe["recipe_id"]}")
      recipe_res = Net::HTTP.get_response(recipe_uri)
      recipe_data = JSON.parse(recipe_res.body)
      @recipe = recipe_data["recipe"]
    end

  end

  def create
  end

  private
  def item_params
    params.require(:item).permit(:name, :category)
  end
end
