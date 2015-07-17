class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.text :title
      t.text :content
      t.integer :category_id
      t.string :hash_url
      t.integer :views, :default => 0

      t.timestamps null: false
    end
  end

  def self.up
    add_index :articles, :id,                unique: true
    add_index :articles, :hash_url,          unique: true
  end
end
