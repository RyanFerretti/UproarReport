#https://github.com/gregbell/active_admin/issues/272
ActiveAdmin.register User, :namespace=>:company_admin, :as => "Representatives" do
  #menu :label => "Representatives"
  config.clear_sidebar_sections!

  controller do
    def authorize_current_resource!
      unless request.path_parameters[:action].to_sym == :index
        user = User.find(params[:id])
        unless current_user.company_id == user.company_id
          raise Exception, "You are not authorized to view this."
        end
      end
    end

    def scoped_collection
      User.rep_for_company(current_user.company_id)
    end
    
    def new
      #@user = User.new
      #@user.role = User::COMPANY_REP
      #@user.company = current_user.company
      new!
    end

    def create
      @user = User.new(params[:representative])
      @user.rep_for(current_user.company)
      if @user.save
        redirect_to company_admin_representative_path(@user), :notice => 'Representative was successfully created for your company'
      else
        render "active_admin/resource/new"
      end
    end
  end

  index do
    column :email
    column :current_sign_in_at
    column :last_sign_in_at
    column :sign_in_count
    default_actions
  end

  form do |f|
    f.inputs "User Details" do
      f.input :email
      f.input :first_name
      f.input :last_name
      #f.input :role, :as => :hidden
      #f.input :company_id, :as => :hidden
    end
    f.buttons
  end

  show :title => :full_name
end 