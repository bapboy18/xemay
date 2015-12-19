class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :name
      t.float :lat
      t.float :lng
      t.references :review, index: true, foreign_key: true
      t.references :region, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
