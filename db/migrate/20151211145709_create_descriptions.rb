class CreateDescriptions < ActiveRecord::Migration
  def change
    create_table :descriptions do |t|
      t.string :name
      t.integer :price
      t.references :review, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
