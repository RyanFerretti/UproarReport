ActiveAdmin.register Company do
  show :title => :name

  sidebar :logo, :only => :show do
    image_tag company.logo.url(:thumb)
  end

  form :partial => "shared/admin_companies_form"
end
