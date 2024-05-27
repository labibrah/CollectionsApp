class AddCustomFieldsToItems < ActiveRecord::Migration[7.1]
  def change
    add_column :items, :custom_fields, :json
  end
end
