class Logo < ActiveRecord::Base
  belongs_to :company

  scope :for_company, lambda {|c_id| where(:company_id => c_id)}

  has_attached_file :image,
                    :styles => { :thumb => "90x120>"},
                    :storage => ENV['S3_BUCKET'] ? :s3 : :filesystem,
                    :s3_credentials => {
                      :access_key_id => ENV['S3_KEY'],
                      :secret_access_key => ENV['S3_SECRET']
                    },
                    :bucket => ENV['S3_BUCKET'],
                    :path => ENV['S3_BUCKET'] ? ":class/:id/:style/:filename" : ":rails_root/public/assets/images/:id/:style/:basename.:extension",
                    :url => "/assets/images/:id/:style/:basename.:extension"

  validates_attachment_presence :image
  attr_accessible :image, :image_file_name, :image_content_type, :image_file_size, :image_updated_at, :company_id, :company

end
