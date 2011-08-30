class EmailContact < ActiveRecord::Base
  belongs_to :company

  attr_accessible :email,:company

  #validates_presence_of :email,:company
end
