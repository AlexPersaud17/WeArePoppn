class Guest < ApplicationRecord
  belongs_to :user
  belongs_to :party
  has_many :comments, dependent: :destroy
  has_many :list_items, dependent: :destroy
  has_many :party_items, through: :list_items
  has_many :items, through: :party_items


end
