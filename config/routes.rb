UproarReport::Application.routes.draw do

  #match "/login" => "active_admin/devise/sessions#new"
  match "admin/logout" => "active_admin/devise/sessions#destroy", :via => :delete, :as => :destroy_admin_user_session

  # galleries
  get "/tour/pictures/:report_hash" => "tour/pictures#index", :as => :public_tour_pictures
  get "/tour/pictures/:company_id/:report_hash" => "tour/pictures#index", :as => :public_tour_pictures_for_company

  devise_for :users, ActiveAdmin::Devise.config

  ActiveAdmin.routes(self)

  post "/company_rep/reports/:report_id/pictures" => "upload_picture#create", :as => :company_rep_report_pictures
  post "/admin/reports/:report_id/pictures" => "upload_picture#create", :as => :admin_report_pictures
  put "/company_rep/reports/:report_id/pictures/:picture_id" => "upload_picture#create", :as => :company_rep_update_uploaded_picture
  put "/admin/reports/:report_id/pictures/:picture_id" => "upload_picture#create", :as => :admin_update_uploaded_picture
  delete "/company_rep/reports/:report_id/pictures/:picture_id" => "upload_picture#create", :as => :company_rep_delete_uploaded_picture
  delete "/admin/reports/:report_id/pictures/:picture_id" => "upload_picture#create", :as => :admin_delete_uploaded_picture

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  #root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'

end
