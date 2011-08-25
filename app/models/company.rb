class Company < ActiveRecord::Base

  has_many :reports

  attr_accessible :name

  validates_presence_of :name
end
