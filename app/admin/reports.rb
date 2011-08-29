ActiveAdmin.register Report do
  index do
    column :tour_date
    column :company
    default_actions if current_user.admin?
  end

  form do |f|
    f.inputs "Report Details" do
      f.input :description
    end
    f.buttons
  end
end
