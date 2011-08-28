class Company < ActiveRecord::Base

  after_create :create_reports!

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

  def create_reports!
    TourDate.order(:id).all.each do |td|
      Report.create!(:tour_date => td, :company => self)
    end
  end
end
