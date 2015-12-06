class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.float :lng
      t.float :lat
      t.string :address

      t.timestamps null: false
    end
  end
end
