ActiveAdmin.register User, :namespace=>:admin do

  index do
    column :email
    column :first_name
    column :last_name
    column :current_sign_in_at
    column :last_sign_in_at
    column :sign_in_count
    default_actions if current_user.admin?
  end

  form do |f|
    f.inputs "User Details" do
      f.input :email
      f.input :first_name
      f.input :last_name
      f.input :role, :as => :select, :collection => User.roles, :prompt => "Select a Role"
    end
    f.buttons
  end
end 