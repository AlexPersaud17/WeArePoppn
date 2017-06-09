class ListItem < ApplicationRecord
  belongs_to :guest
  belongs_to :party_item

end
