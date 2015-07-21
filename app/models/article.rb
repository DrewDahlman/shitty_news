class Article < ActiveRecord::Base
	attr_accessor :rank

	belongs_to :category
	before_create :assign_hash

	#--------------------------------------------------------------
	#
	#   Determine rank based on this formula
	# 	(v / (t - c) / 3600) ** 1.2
	# 	(Views / (TimeNow - TimeCreated) / 1 hour) ** 1.2
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
