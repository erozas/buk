class RemoveAuthorNameFromBooks < ActiveRecord::Migration[8.0]
  def change
    remove_column :books, :author_name
  end
end
