class TopHeadline < ActiveRecord::Base
	mount_uploader :photo, TopHeadlinePhotoUploader

end
