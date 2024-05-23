class CreateCollections < ActiveRecord::Migration[7.1]
  def change
    create_table :collections do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.text :description
      t.integer :topic
      t.jsonb :custom_fields
      t.string :image

      t.timestamps
    end
  end
end
