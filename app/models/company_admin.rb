class CompanyAdmin < User
  belongs_to :company

  attr_accessible :company_id

  validates_presence_of :company_id
end
