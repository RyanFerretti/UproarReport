class TourReport < ActiveRecord::Base
  belongs_to :tour_date
  belongs_to :user

  validates_attachment_presence :description
  attr_accessible :description

end
