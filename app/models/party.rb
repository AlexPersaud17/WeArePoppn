class Party < ApplicationRecord
  belongs_to :host, class_name: "User"
  has_many :party_items, dependent: :destroy
  has_many :items, through: :party_items
  has_many :guests, dependent: :destroy
  has_many :comments, through: :guests
  has_many :attendees, through: :guests, source: :user

  validates :name, :description, :location, :date, presence: true

  def drinks
    items.where(category: "Drink")
  end

  def dishes
    items.where(category: "Food")
  end

  def supplies
    items.where(category: "Supplies")
  end

  def absolutAPI
    query = sampled_drink.gsub(' ', '%20')
    uri = URI.parse("http://addb.absolutdrinks.com/quickSearch/drinks/#{query}/?apiKey=#{ENV["DRINK_API_KEY"]}")
    response = Net::HTTP.get_response(uri)
    body = JSON.parse(response.body)
    return body["result"].sample(3)
  end

  def sampled_drink
    return drinks.sample.name
  end
end
