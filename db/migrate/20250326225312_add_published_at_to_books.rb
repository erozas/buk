class AddPublishedAtToBooks < ActiveRecord::Migration[8.0]
  def change
    add_column :books, :published_at, :datetime
  end
end
