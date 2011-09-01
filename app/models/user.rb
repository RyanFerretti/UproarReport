class User < ActiveRecord::Base
  after_create :create_associations!

  belongs_to :company
  has_many :reports

  scope :rep_for_company, lambda {|company_id| where(:company_id => company_id).where(:role => COMPANY_REP)}

  before_create { |u| u.role = COMPANY_REP if role.nil? }
  after_create { |u| u.send_reset_password_instructions }

  devise :database_authenticatable,:recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :first_name, :last_name, :password, :password_confirmation, :remember_me, :role, :company_id

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :role

  def self.roles
    {"Administrator" => ADMIN, "Company Admin" => COMPANY_ADMIN, "Company Rep" => COMPANY_REP, "Tour Rep" => TOUR_REP}
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

  def rep_for(company)
    self.company_id = company.id
    self.role = COMPANY_REP
  end

  def full_name
    "#{first_name} #{last_name}"
  end
  
private

  TOUR_REP = 3
  COMPANY_REP = 2
  COMPANY_ADMIN = 1
  ADMIN = 0
  
  def is_role?(r)
      role == r
  end

  def create_associations!
    if company_rep? || tour_rep?
      TourDate.order(:id).all.each do |td|
        Report.create!(:tour_date => td, :user => self)
      end
    end
  end
end
