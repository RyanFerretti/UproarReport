ActiveAdmin.register Picture, :namespace=>:tour do
  config.clear_sidebar_sections!
  
  actions :index

  controller do
    def authorize_current_resource!
      @report = Report.where(:state => :published).where(:public_url => params[:report_hash]).first
      @company_id = params[:company_id]
    end

    def scoped_collection
      if @company_id
        @report.pictures.where :company_id => @company_id
      else
        @report.pictures
      end
    end
  end

  index :as => :grid do |picture|
    link_to(image_tag(picture.image.url(:thumb)), "#")
  end
end
