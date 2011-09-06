class ApplicationController < ActionController::Base
  protect_from_forgery

  # need after login hook to send them to the right page!

  def authenticate_users!
    unless request.fullpath.match("tour/pictures")
      user = current_user
      if user
        unless user_allowed_for_path?(user,request.fullpath)
          redirect_to root_path_for_user(user)
        else
          authenticate_user!
        end
      else
        authenticate_user!
      end
    end
  end

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || root_path_for_user(resource)
  end

  def authorize_current_resource!

  end

  private

  def user_allowed_for_path?(user,path)
    allowed = false
    if user.admin? && path.match("admin")
      allowed = true
    elsif user.company_admin? && path.match("company_admin")
      allowed = true
    elsif user.company_rep? && path.match("company_rep")
      allowed = true
    elsif user.tour_rep? && path.match("tour_rep")
      allowed = true
    end
    allowed
  end

  def root_path_for_user(resource)
    if resource.admin?
      admin_dashboard_path
    elsif resource.company_admin?
      company_admin_dashboard_path
    elsif resource.company_rep?
      company_rep_dashboard_path
    elsif resource.tour_rep?
      tour_rep_dashboard_path
    end
  end
end
