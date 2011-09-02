require 'paperclip_processors/watermark'

class Picture < ActiveRecord::Base
  belongs_to :report
  belongs_to :company
  
  has_attached_file :image,
                    :processors => [:watermark],
                    :styles => lambda { |attachment| attachment.instance.image_styles},
                    :storage => ENV['S3_BUCKET'] ? :s3 : :filesystem,
                    :s3_credentials => {
                      :access_key_id => ENV['S3_KEY'],
                      :secret_access_key => ENV['S3_SECRET']
                    },
                    :bucket => ENV['S3_BUCKET'],
                    :path => ENV['S3_BUCKET'] ? ":class/:id/:style/:filename" : ":rails_root/public/assets/images/:id/:style/:basename.:extension",
                    :url => "/assets/images/:id/:style/:basename.:extension"


  validates_attachment_presence :image
  attr_accessible :report_id, :image, :image_file_name, :image_content_type, :image_file_size, :image_updated_at, :company

  def image_styles
    style = { :watermarked => { :geometry => '800x600>', :watermark_path => company.logo.path } }
    style[:thumb] = ["260x195",:png]
    style
  end
end