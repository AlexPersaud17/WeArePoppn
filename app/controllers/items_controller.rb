class ItemsController < ApplicationController
  def new
    @item = Item.new
    @party = Party.find_by(id: params[:party_id])
  end

  def show
    item = Item.find(params[:id])
    if item.category == "Food"
      query = item.name.gsub(' ', '%20')
      search_uri = URI.parse("http://food2fork.com/api/search?key=#{ENV['FOOD_TO_FORK_KEY']}&q=#{query}")
      search_response = Net::HTTP.get_response(search_uri)
      search_results = JSON.parse(search_response.body)
      recipe = search_results["recipes"][0]

      recipe_uri = URI.parse("http://food2fork.com/api/get?key=#{ENV['FOOD_TO_FORK_KEY']}&rId=#{recipe["recipe_id"]}")
      recipe_res = Net::HTTP.get_response(recipe_uri)
      recipe_data = JSON.parse(recipe_res.body)
      @recipe = recipe_data["recipe"]

    end

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
