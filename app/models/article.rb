class Article < ActiveRecord::Base
	has_one :category
	before_create :assign_hash

	private
	def assign_hash
		self.hash_url = SecureRandom.urlsafe_base64
	end
end
