class Article < ActiveRecord::Base
	has_one :category
end
