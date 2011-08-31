ActiveAdmin.register Company, :namespace=>:company_admin do

  actions :edit, :update, :show

  controller do
    def authorize_current_resource!
      unless request.path_parameters[:action].to_sym == :index
        unless current_user.company_id == params[:id].to_i
          raise Exception, "You are not authorized to view this."
        end
      end
    end

    def scoped_collection
      current_user.company.email_contacts
    end

    def index
      redirect_to edit_company_admin_company_url(current_user.company.id)
    end
  end

  form :partial => "shared/companies_form"
end
