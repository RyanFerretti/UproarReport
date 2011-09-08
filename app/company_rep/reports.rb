ActiveAdmin.register Report, :namespace=>:company_rep do

  actions :index, :show, :edit, :update, :publish

  controller do
    def authorize_current_resource!
      unless request.path_parameters[:action].to_sym == :index
        report = Report.find(params[:id],:include => :user)
        unless current_user.id == report.user.id
          raise Exception, "You are not authorized to view this."
        end
      end
    end
    
    def scoped_collection
      Report.for_company(current_user.company_id)
    end
  end

  member_action :publish, :method => :put do
    report = Report.find(params[:id])
    report.publish
    redirect_to :action => :show, :notice => "This Report has been Published!"
  end

  action_item :only => :show do
    link_to "Publish", publish_company_rep_report_path(params[:id]), :method => :put
  end

  index do
    column :tour_date
    column("State") {|report| status_tag(report.state) }
    column "Actions" do |report|
      raw "#{link_to "View", company_rep_report_path(report)} #{link_to "Edit", edit_company_rep_report_path(report)}"
    end
  end


  form do |f|
    f.inputs "Details" do
      f.input :description
    end
    f.buttons
  end

  sidebar :upload_pictures, :only => :edit, :partial => "/upload_picture/company_rep_uploader"

  show :title => :full_name do
      h3 status_tag(report.state)
      div do
        simple_format report.description
      end
      render  "/shared/show_images"
  end
end
