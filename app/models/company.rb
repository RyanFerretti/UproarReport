class Company < ActiveRecord::Base

  has_many :reports

  attr_accessible :name

  validates_presence_of :name

  def admin
    find_user User::COMPANY_ADMIN
  end

  def rep
    find_user User::COMPANY_REP
  end

private

  def find_user(role)
    User.where(:company_id => id).where(:role => role).first
  end
end
