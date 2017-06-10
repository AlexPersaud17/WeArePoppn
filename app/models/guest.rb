class Guest < ApplicationRecord
  belongs_to :user
  belongs_to :party
  has_many :comments
  has_many :list_items, dependent: :destroy


end
