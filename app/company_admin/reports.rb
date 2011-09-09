ActiveAdmin.register Report, :namespace=>:company_admin do
  menu :label => "Published Reports"

  actions :index, :show

  filter :tour_date
  #filter :user, :as => :select, :collection => proc { User.where(:company_id => current_user.company_id) } FIXME!!!!
  #filter :state, :as => :select, :collection => proc { {"Not Started" => "not started","In Progress" => "in progress","Published" => "published"} }
  filter :description
  filter :published_at

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
      Report.for_company(current_user.company_id).published
    end
  end

  index do
    column :tour_date
    column("State") {|report| status_tag(report.state) }
    column "Actions" do |report|
      link_to "View", company_admin_report_path(report)
    end
  end

  show :title => :full_name do
      h3 status_tag(report.state)
      div do
        simple_format report.description
      end
      render  "/shared/show_images"
  end
end
