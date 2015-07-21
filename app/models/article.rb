class Article < ActiveRecord::Base
	attr_accessor :rank

	belongs_to :category
	before_create :assign_hash

	#--------------------------------------------------------------
	#
	#   Determine rank based on this formula
	# 	(p / (t - c) / 3600) ** 1.2
	# 	(PostTime / (TimeNow - TimeCreated) / HOURS_IN_DAY) ** 1.2
	#
	#--------------------------------------------------------------
	def rank
		(self.views / (Time.now - self.created_at.to_time) / 3600) ** 1.2
	end

	private
	def assign_hash
		self.hash_url = SecureRandom.urlsafe_base64
	end
end
