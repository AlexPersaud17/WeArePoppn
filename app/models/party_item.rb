class PartyItem < ApplicationRecord
  belongs_to :item
  belongs_to :party
  has_one :list_item, dependent: :destroy
  has_one :guest, through: :list_item
  has_one :user, through: :guest


end
