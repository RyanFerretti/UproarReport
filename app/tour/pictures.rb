ActiveAdmin.register Picture, :namespace=>:tour do
  config.clear_sidebar_sections!
  
  actions :index

  controller do
    def authorize_current_resource!
      @report = Report.where(:state => :published).where(:public_url => params[:report_hash])
    end

    def scoped_collection
      @report.pictures
    end
  end

  index :as => :grid do |picture|
    link_to(image_tag(picture.image.url(:thumb)), "#")
  end
end
