class CreateReviewImages < ActiveRecord::Migration
  def change
    create_table :review_images do |t|
      t.string :image
      t.string :review_id

      t.timestamps null: false
    end
  end
end
