class Item < ApplicationRecord
  has_many :party_items
  has_many :parties, through: :party_items
  has_many :list_items, through: :party_items

  def recipeAPI
    query = name.gsub(' ', '%20')
    search_uri = URI.parse("http://food2fork.com/api/search?key=#{ENV['FOOD_TO_FORK_KEY']}&q=#{query}")
    search_response = Net::HTTP.get_response(search_uri)
    search_results = JSON.parse(search_response.body)
    recipe = search_results["recipes"][rand(0..search_results["recipes"].length-1)]

    recipe_uri = URI.parse("http://food2fork.com/api/get?key=#{ENV['FOOD_TO_FORK_KEY']}&rId=#{recipe["recipe_id"]}")
    recipe_res = Net::HTTP.get_response(recipe_uri)
    recipe_data = JSON.parse(recipe_res.body)

    return recipe_data["recipe"]
  end

end
