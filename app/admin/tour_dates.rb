ActiveAdmin.register TourDate, :namespace=>:admin  do

  index do
    column :city
    column :state
    column :venue
    column :date
    default_actions
  end
end
