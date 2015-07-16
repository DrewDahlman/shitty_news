class Source < ActiveRecord::Base
	belongs_to :url
	has_one :category, :through => :url, :class_name => "Category"
end
