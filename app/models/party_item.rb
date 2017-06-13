class PartyItem < ApplicationRecord
  belongs_to :item
  belongs_to :party
  has_one :list_item, dependent: :destroy
  has_many :guests, through: :list_items


end
