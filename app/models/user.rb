class User < ApplicationRecord
  has_many :parties, foreign_key: :host_id

  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true
  has_secure_password

  def full_name
    first_name + " " + last_name
  end

end
