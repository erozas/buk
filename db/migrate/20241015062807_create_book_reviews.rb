class CreateBookReviews < ActiveRecord::Migration[7.2]
  def change
    create_table :book_reviews do |t|
      t.references :user, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true
      t.integer :rating
      t.text :content

      t.timestamps
    end
  end
end
