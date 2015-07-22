class AddCategoryToTopHeadline < ActiveRecord::Migration
  def change
    add_column :top_headlines, :category_id, :integer
  end
end
