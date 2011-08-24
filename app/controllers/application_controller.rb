class ApplicationController < ActionController::Base
  protect_from_forgery

  # need after login hook to send them to the right page!

  def authenticate_users!
    user = current_user
    if user
      unless user_allowed_for_path?(user,request.fullpath)
        render :status => :forbidden
      else
        authenticate_user!
      end
    else
      authenticate_user!
    end
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
end
