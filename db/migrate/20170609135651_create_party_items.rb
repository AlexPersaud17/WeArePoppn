class CreatePartyItems < ActiveRecord::Migration[5.0]
  def change
    create_table :party_items do |t|
      t.references :party, foreign_key: true
      t.references :item, foreign_key: true

      t.timestamps(null: false)
    end
  end
end
