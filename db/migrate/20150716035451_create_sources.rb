class CreateSources < ActiveRecord::Migration
  def change
    create_table :sources do |t|
      t.text :title
      t.text :content
      t.string :link
      t.integer :url_id

      t.timestamps null: false
    end
  end
end
