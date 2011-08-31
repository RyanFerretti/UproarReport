ActiveAdmin.register Picture, :namespace=>:tour do
  config.clear_sidebar_sections!
  
  actions :index

  controller do
    def authorize_current_resource!
      hash = params[:report_hash]
      @report = Report.find(hash)
    end

    def scoped_collection
      @report.pictures
    end
  end

  index :as => :grid do |picture|
    link_to(image_tag(picture.image.url(:thumb)), "#")
  end
end
