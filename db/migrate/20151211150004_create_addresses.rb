class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :province
      t.string :town
      t.float :lat
      t.float :lng

      t.timestamps null: false
    end
  end
end
