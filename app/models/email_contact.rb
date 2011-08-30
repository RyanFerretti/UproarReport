class EmailContact < ActiveRecord::Base
  belongs_to :company

  attr_accessible :email,:company,:company_id

  #validates_presence_of :email,:company
end
