ActiveAdmin.register Company, :namespace=>:company_admin do

  actions :edit, :update, :show

  controller do
    def scoped_collection
      current_user.company.email_contacts
    end
    def index
      redirect_to edit_company_admin_company_url(current_user.company.id)
    end
  end

  form :partial => "shared/companies_form"
end
