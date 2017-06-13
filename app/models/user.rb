class User < ApplicationRecord
  has_many :hosted_parties, class_name: "Party", foreign_key: :host_id
  has_many :guests, dependent: :destroy

  has_many :list_items, through: :guests
  has_many :party_items, through: :list_items
  has_many :items, through: :party_items

  has_many :attended_parties, through: :guests, source: :party
  has_many :posted_comments, through: :guests, source: :comments

  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true
  has_secure_password

  def full_name
    first_name + " " + last_name
  end

end
