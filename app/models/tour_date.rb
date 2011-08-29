class TourDate < ActiveRecord::Base
  attr_accessible :city, :state, :venue, :date

  validates_presence_of :city
  validates_presence_of :state
  validates_presence_of :venue
  validates_presence_of :date

  def name
    "#{city}, #{state}"
  end
end
