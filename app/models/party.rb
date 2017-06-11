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
end
