# encoding: utf-8

class TopHeadlinePhotoUploader < CarrierWave::Uploader::Base

  storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "panels"
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

   def filename
    random_token = Digest::SHA2.hexdigest("#{Time.now.utc}--#{model.id.to_s}").first(10)
    ivar = "@#{mounted_as}_secure_token"    
    token = model.instance_variable_get(ivar)
    token ||= model.instance_variable_set(ivar, random_token)
    "_#{token}.#{file.extension}" if original_filename
  end

  def remove!
    begin
      super
    rescue Fog::Storage::Rackspace::NotFound
    end
  end

end
