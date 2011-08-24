class User < ActiveRecord::Base

  after_create { |admin| admin.send_reset_password_instructions }

  devise :database_authenticatable,:recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :role

  validates_presence_of :role

  def self.roles
    {"Administrator" => ADMIN, "Reporter" => REPORTER, "Sponsor" => SPONSOR}
  end

  def admin?
    is_role?(ADMIN)
  end

  def tour_rep?
    is_role?(TOUR_REP)
  end

  def company_rep?
    is_role?(COMPANY_REP)
  end

  def company_admin?
    is_role?(COMPANY_ADMIN)
  end

  def password_required?
    new_record? ? false : super
  end
private

  TOUR_REP = 3
  COMPANY_REP = 2
  COMPANY_ADMIN = 1
  ADMIN = 0
  
  def is_role?(r)
      role == r
  end
end
