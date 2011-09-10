ActiveAdmin.register Report do

  filter :tour_date
  filter :user
  filter :state, :as => :select, :collection => proc { {"Not Started" => "not started","In Progress" => "in progress","Published" => "published"} }

  index do
    column "Tour Date" do |report|
      link_to report.full_name, admin_report_path(report)
    end
    column :user, :sortable => false
    default_actions if current_user.admin?
  end

  form do |f|
    f.inputs "Report Details" do
      f.input :description
    end
    f.buttons
  end
  
  sidebar :upload_pictures, :only => :edit, :partial => "/upload_picture/admin_uploader"

  member_action :publish, :method => :put do
    report = Report.find(params[:id])
    report.publish
    redirect_to :action => :show, :notice => "This Report has been Published!"
  end

  action_item :only => :show do
    link_to "Publish", publish_admin_report_path(params[:id]), :method => :put
  end

  show :title => :full_name do
    h3 status_tag(report.state)
    div do
      simple_format report.description
    end
    render  "/shared/show_images"
  end
end
