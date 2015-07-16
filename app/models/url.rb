class Url < ActiveRecord::Base
	has_many :sources
	belongs_to :category
end
