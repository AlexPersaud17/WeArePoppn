class Party < ApplicationRecord
  belongs_to :host, class_name: "User"

  validates :name, :description, :location, :date, presence: true
end
