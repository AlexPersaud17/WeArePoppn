class PartyItem < ApplicationRecord
  belongs_to :item
  belongs_to :party
  has_many :list_items, dependent: :destroy


end
