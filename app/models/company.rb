class Company < ActiveRecord::Base

  after_create :create_associations!

  has_many :users
  has_many :email_contacts

  accepts_nested_attributes_for :email_contacts

  attr_accessible :name, :email_contacts_attributes, :logo

  validates_presence_of :name

  has_attached_file :logo,
                    :styles => { :original => "140x90#" },
                    :path => lambda { |path| ENV['S3_BUCKET'] ? "watermarks/#{path.instance.name.parameterize}/logo.:extension" : ":rails_root/public/images/watermarks/#{path.instance.name.parameterize}/logo.:extension" },
                    :url => lambda { |url| "/images/watermarks/#{url.instance.name.parameterize}/logo.:extension" }

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
    10.times {email_contacts.create!}
  end
end
