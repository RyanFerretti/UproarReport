class User < ActiveRecord::Base

  after_create { |admin| admin.send_reset_password_instructions }

  devise :database_authenticatable,:recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me

  scope :roles, lambda{[["Administrator",ADMIN],["Reporter",REPORTER]["Sponsor",SPONSOR]]}

  def admin?
    is_role?(ADMIN)
  end

  def reporter?
    is_role?(REPORTER)
  end

  def sponsor?
    is_role?(SPONSOR)
  end

  def password_required?
    new_record? ? false : super
  end
private

  ADMIN = 2
  REPORTER = 1
  SPONSOR = 0
  
  def is_role?(r)
      role == r
  end
end
