class ChangePartiesDate < ActiveRecord::Migration[5.0]
  def change
    change_column(:parties, :date, :datetime)
  end
end
