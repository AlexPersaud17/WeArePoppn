class CreateListItems < ActiveRecord::Migration[5.0]
  def change
    create_table :list_items do |t|
      t.references :guest, foreign_key: true
      t.references :party_item, foreign_key: true

      t.timestamps(null: false)
    end
  end
end
