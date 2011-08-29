ActiveAdmin.register Logo, :namespace=>:company_admin do
  config.clear_sidebar_sections!

  controller do
    def scoped_collection
      Logo.for_company(current_user.company_id).limit(1)
    end
    
    def create
      @logo = Logo.new(params[:logo])
      @logo.company = current_user.company
      if @logo.save
        redirect_to company_admin_logo_path(@logo), :notice => 'Representative was successfully created for your company'
      else
        render "active_admin/resource/new"
      end
    end
  end

  index do
    column :image
    default_actions
  end

  form do |f|
    f.inputs "Logo", :multipart => true do
      f.input :image, :as => :file
    end
    f.buttons
  end

  show do
    div do
      image_tag(logo.image_file_name)
    end
  end

end