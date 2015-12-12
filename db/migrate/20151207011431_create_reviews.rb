class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :name
      t.text :content
      t.integer :phone_number
      t.boolean :portable
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :reviews, [:user_id, :created_at]
  end
end
