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

  form do |f|
    f.inputs "Logo", :multipart => true do
      f.form_buffers.last << "<img src='#{f.object.image_url rescue nil}' style='float:left;margin:1em;' />".html_safe
      f.input :image, :as => :file
    end

    f.inputs "Email Contacts" do
      f.has_many :email_contacts do |j|
        j.inputs :email
      end
    end

    f.buttons
  end
end
