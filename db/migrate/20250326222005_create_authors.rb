class CreateAuthors < ActiveRecord::Migration[8.0]
  def change
    create_table :authors do |t|
      t.string :first_name
      t.string :last_name
      t.date :birthdate
      t.string :nationality
      t.text :bio
      t.integer :books_published_count
      t.string :wikipedia_url

      t.timestamps
    end
  end
end
