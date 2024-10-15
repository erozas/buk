class CreateArticles < ActiveRecord::Migration[7.2]
  def change
    create_table :articles do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.string :excerpt
      t.text :content
      t.string :slug
      t.datetime :published_at
      t.boolean :published, default: false

      t.timestamps
    end

    add_index :articles, :title, unique: true
    add_index :articles, :slug, unique: true
  end
end
