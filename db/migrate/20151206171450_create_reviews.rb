class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :name
      t.text :content
      t.integer :phone_number
      t.text :description
      t.integer :rating
      t.boolean :portable

      t.timestamps null: false
    end
  end
end
