class CreateParties < ActiveRecord::Migration[5.0]
  def change
    create_table :parties do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.string :location, null: false
      t.date :date, null: false
      t.references :host

      t.timestamps(null: false)
    end
  end
end
