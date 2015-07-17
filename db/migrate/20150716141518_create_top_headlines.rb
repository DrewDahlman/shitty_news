class CreateTopHeadlines < ActiveRecord::Migration
  def change
    create_table :top_headlines do |t|
      t.string :title
      t.string :photo
      t.text :content
      t.string :hash_url
      t.integer :views, :default => 0

      t.timestamps null: false
    end
  end
  def self.up
    add_index :top_headlines, :id,                unique: true
    add_index :top_headlines, :hash_url,          unique: true
  end
end
