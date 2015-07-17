class TopHeadline < ActiveRecord::Base
	before_create :assign_hash

	mount_uploader :photo, TopHeadlinePhotoUploader

	private
	def assign_hash
		self.hash_url = SecureRandom.urlsafe_base64
	end
end
