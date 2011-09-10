class TourDate < ActiveRecord::Base

  has_many :tour_reports

  attr_accessible :city, :state, :venue, :date

  validates_presence_of :city
  validates_presence_of :state
  validates_presence_of :venue
  validates_presence_of :date

  def name
    "#{city}, #{state}"
  end

  def full_name
    "Report: #{date.strftime("%m/%d/%Y")} - #{city}, #{state}"
  end
end
