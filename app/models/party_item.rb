class PartyItem < ApplicationRecord
  belongs_to :item
  belongs_to :party
  has_many :list_items, dependent: :destroy
  has_many :guests, through: :list_items


end
