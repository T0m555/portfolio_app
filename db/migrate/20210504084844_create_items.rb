class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.text :title,         null: false
      t.text :url,          null: false
      t.integer :genre_id,  null: false
      t.text :description,    null: false
      t.references :user,  null: false, foreign_key: true

      t.timestamps
    end
  end
end
