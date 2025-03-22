class CreateGenres < ActiveRecord::Migration[8.0]
  def change
    create_table :genres do |t|
      t.string :name, null: false
      t.string :excerpt
      t.text :description
      t.string :slug

      t.timestamps
    end

    add_index :genres, :name, unique: true
    add_index :genres, :slug, unique: true
  end
end
