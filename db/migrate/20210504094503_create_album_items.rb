class CreateAlbumItems < ActiveRecord::Migration[6.0]
  def change
    create_table :album_items do |t|
      t.references :album,  null: false, foreign_key: true
      t.references :item,  null: false, foreign_key: true

      t.timestamps
    end
  end
end
