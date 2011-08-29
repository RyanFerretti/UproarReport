ActiveAdmin.register Report, :namespace=>:company_rep do

  actions :index, :show, :edit, :update, :publish

  controller do
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

  sidebar :upload_pictures, :only => :edit, :partial => "/upload_picture/uploader"
end
