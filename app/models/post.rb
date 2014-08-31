class Post < ActiveRecord::Base
  has_attached_file :picture, styles: { medium: "300x300>" },
    storage: :s3,
    s3_credentials: {
      bucket: 'challengeme',
      access_key_id: Rails.application.secrets.s3_access_key_id,
      secret_access_key: Rails.application.secrets.s3_access_access_key
    }
	
	validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/ 

	belongs_to :event
end
