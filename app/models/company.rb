class Company < ActiveRecord::Base

  after_create :create_associations!

  has_many :reports
  has_many :email_contacts
  has_one :logo

  accepts_nested_attributes_for :email_contacts

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

  def create_associations!
    TourDate.order(:id).all.each do |td|
      Report.create!(:tour_date => td, :company => self)
    end
    10.times { EmailContact.create!(:company => self)}
  end
end
