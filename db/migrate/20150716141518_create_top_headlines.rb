class CreateTopHeadlines < ActiveRecord::Migration
  def change
    create_table :top_headlines do |t|
      t.string :title
      t.string :photo
      t.text :content

      t.timestamps null: false
    end
  end
end
