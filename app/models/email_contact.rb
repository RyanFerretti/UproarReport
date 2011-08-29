class EmailContact < ActiveRecord::Base
  belongs_to :company

  attr_accessible :email,:company
end
