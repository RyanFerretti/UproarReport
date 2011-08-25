class Report < ActiveRecord::Base
  belongs_to :tour_date
  belongs_to :company

  attr_accessible :description, :tour_date, :company_id

  validates_presence_of :description
end
