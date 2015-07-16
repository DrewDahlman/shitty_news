class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.string :url
      t.integer :category_id

      t.timestamps null: false
    end
  end
end
