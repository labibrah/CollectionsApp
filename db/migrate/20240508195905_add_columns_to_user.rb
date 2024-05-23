class AddColumnsToUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :status, :text
    add_column :users, :lang, :text
    add_column :users, :darkMode, :text
  end
end
