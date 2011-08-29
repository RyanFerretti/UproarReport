ActiveAdmin.setup do |config|

  # == Site Title
  #
  # Set the title that is displayed on the main layout
  # for each of the active admin pages.
  #
  config.site_title = "Uproar Report"


  # == Default Namespace
  #
  # Set the default namespace each administration resource
  # will be added to. 
  #
  # eg: 
  #   config.default_namespace = :hello_world
  #
  # This will create resources in the HelloWorld module and
  # will namespace routes to /hello_world/*
  #
  # To set no namespace by default, use:
  #   config.default_namespace = false
  config.default_namespace = :admin


  # == User Authentication
  #
  # Active Admin will automatically call an authentication 
  # method in a before filter of all controller actions to 
  # ensure that there is a currently logged in admin user.
  #
  # This setting changes the method which Active Admin calls
  # within the controller.
  config.authentication_method = :authenticate_users!


  # == Current User
  #
  # Active Admin will associate actions with the current
  # user performing them.
  #
  # This setting changes the method which Active Admin calls
  # to return the currently logged in user.
  config.current_user_method = :current_user


  # == Admin Comments
  #
  # Admin notes allow you to add notes to any model
  #
  # Admin notes are enabled by default in the default
  # namespace only. You can turn them on in a namesapce
  # by adding them to the comments array.
  #
  config.allow_comments_in = [:admin,:company_admin,:company_rep,:tour_rep]


  # == Controller Filters
  #
  # You can add before, after and around filters to all of your
  # Active Admin resources from here. 
  #
  # config.before_filter :setup_view_data


  # == Register Stylesheets & Javascripts
  #
  # We recommend using the built in Active Admin layout and loading
  # up your own stylesheets / javascripts to customize the look
  # and feel.
  #
  # To load a stylesheet:
  config.register_stylesheet 'custom-active-admin.css'
  #
  # To load a javascript file:
  config.register_javascript 'custom-active-admin.js'

  # == Load Namespaces
  config.load_paths = [File.expand_path('app/admin', Rails.root),
                       File.expand_path('app/company_admin', Rails.root),
                       File.expand_path('app/company_rep', Rails.root),
                       File.expand_path('app/tour_rep', Rails.root),]

  #config.logout_link_path = :logout_path
  #config.logout_link_method = :get

end
