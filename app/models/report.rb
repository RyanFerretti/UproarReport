class Report < ActiveRecord::Base
  belongs_to :tour_date
  belongs_to :company

  attr_accessible :description, :tour_date, :company

  validates_presence_of :tour_date, :company

  scope :for_company, lambda{|c_id| where(:company_id => c_id) }
end
