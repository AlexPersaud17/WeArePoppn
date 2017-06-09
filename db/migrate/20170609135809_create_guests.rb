class CreateGuests < ActiveRecord::Migration[5.0]
  def change
    create_table :guests do |t|
      t.references :party, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps(null: false)
    end
  end
end
