class Guest < ApplicationRecord
  belongs_to :user
  belongs_to :party
  has_many :comments, dependent: :destroy
  has_many :list_items, dependent: :destroy


end
