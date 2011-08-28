ActiveAdmin.register Report, :namespace=>:company_admin do

  actions :index, :show

  controller do
    def scoped_collection
      Report.for_company(current_user.company_id)
    end
  end

  index do
    column :tour_date
    column :company
    column "Actions" do |report|
      link_to "View", company_admin_report_path(report)
    end
  end
  
end
