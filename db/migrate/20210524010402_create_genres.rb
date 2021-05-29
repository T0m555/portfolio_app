class CreateGenres < ActiveRecord::Migration[6.0]
  def change
    create_table :genres do |t|
      t.text :name,          null: false
      t.text :description,    null: false
      t.timestamps
    end
  end
end
