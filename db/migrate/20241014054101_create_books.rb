class CreateBooks < ActiveRecord::Migration[7.2]
  def change
    create_table :books do |t|
      t.string :title
      t.string :isbn
      t.text :excerpt
      t.text :description
      t.string :slug
      t.integer :pages_count, default: 0
      t.string :author_name

      t.timestamps
    end

    add_index :books, :title, unique: true
    add_index :books, :slug, unique: true
  end
end
