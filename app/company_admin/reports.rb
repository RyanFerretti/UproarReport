ActiveAdmin.register Report, :namespace=>:company_admin do

  actions :index, :show

  controller do
    def authorize_current_resource!
      unless request.path_parameters[:action].to_sym == :index
        report = Report.find(params[:id],:include => :user)
        unless current_user.company_id == report.user.company_id
          raise Exception, "You are not authorized to view this."
        end
      end
    end
    
    def scoped_collection
      Report.for_company(current_user.company_id)
    end
  end

  index do
    column :tour_date
    column("State") {|report| status_tag(report.state) }
    column "Actions" do |report|
      link_to "View", company_admin_report_path(report)
    end
  end
  
end
