require 'paperclip_processors/watermark'

class Picture < ActiveRecord::Base
  belongs_to :report
  has_attached_file :image,
                    :processors => [:watermark],
                    :styles => lambda { |attachment| {
                        :thumb => ["260x195",:png],
                        :watermarked => {
                            :geometry => '800x600>',
                            :watermark_path => attachment.instance.logo_path
                        }
                      }
                    },
                    :storage => ENV['S3_BUCKET'] ? :s3 : :filesystem,
                    :s3_credentials => {
                      :access_key_id => ENV['S3_KEY'],
                      :secret_access_key => ENV['S3_SECRET']
                    },
                    :bucket => ENV['S3_BUCKET'],
                    :path => ENV['S3_BUCKET'] ? ":class/:id/:style/:filename" : ":rails_root/public/assets/images/:id/:style/:basename.:extension",
                    :url => "/assets/images/:id/:style/:basename.:extension"


  validates_attachment_presence :image
  attr_accessible :report_id, :image, :image_file_name, :image_content_type, :image_file_size, :image_updated_at, :logo_path

  def logo_path
    self.logo_path || Report.find(self.report_id, :include => {:user => :company}).user.company.logo.path
  end
  
end