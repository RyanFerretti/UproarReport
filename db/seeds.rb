# users
unless Rails.env.production?
  c = Company.create!(:name => "Rockstar")
  Company.create!(:name => "Best Buy")
  Company.create!(:name => "Jagermeister")
  Company.create!(:name => "Ernie Ball")
  Company.create!(:name => "Zippo")

  User.create!(:email => 'admin@example.com', :password => 'password', :password_confirmation => 'password', :first_name => "admin", :last_name => "person", :role => User::ADMIN)
  User.create!(:email => 'company_admin@example.com', :password => 'password', :password_confirmation => 'password', :first_name => "company", :last_name => "admin", :role => User::COMPANY_ADMIN, :company_id => c.id)
  User.create!(:email => 'company_rep@example.com', :password => 'password', :password_confirmation => 'password', :first_name => "company", :last_name => "rep", :role => User::COMPANY_REP, :company_id => c.id)
  User.create!(:email => 'tour_rep@example.com', :password => 'password', :password_confirmation => 'password', :first_name => "tour", :last_name => "rep", :role => User::TOUR_REP)
end
puts "#{User.count} users created"

# August Tour Dates
TourDate.create!(:city => "Camden", :state => "NJ", :venue => "Susquehanna Bank Center", :date => "2011-08-26")
TourDate.create!(:city => "Scranton", :state => "PA", :venue => "Toyota Pavilion", :date => "2011-08-27")
TourDate.create!(:city => "Boston", :state => "MA", :venue => "Comcast Center", :date => "2011-08-28")
TourDate.create!(:city => "Washington", :state => "DC", :venue => "Jiffy Lube Live", :date => "2011-08-31")
# September Tour Dates
TourDate.create!(:city => "Virginia Beach", :state => "VA", :venue => "Farm Bureau Live at Virginia Beach", :date => "2011-09-01")
TourDate.create!(:city => "Tampa", :state => "FL", :venue => "1-800-ASK-GARY Amphitheatre", :date => "2011-09-03")
TourDate.create!(:city => "Biloxi", :state => "MS", :venue => "Mississippi Coast Coliseum", :date => "2011-09-04")
TourDate.create!(:city => "Houston", :state => "TX", :venue => "Cynthia Woods Mitchell Pavilion", :date => "2011-09-05")
TourDate.create!(:city => "Detroit", :state => "MI", :venue => "DTE Energy Music Theatre", :date => "2011-09-09")
TourDate.create!(:city => "Buffalo", :state => "NY", :venue => "Darien Lake Performing Arts Center", :date => "2011-09-10")
TourDate.create!(:city => "Hartford", :state => "CT", :venue => "Comcast Theatre", :date => "2011-09-11")
TourDate.create!(:city => "Montreal", :state => "QC", :venue => "Parc Jean Drapeau", :date => "2011-09-13")
TourDate.create!(:city => "Toronto", :state => "ON", :venue => "Molson Canadian Amphitheatre", :date => "2011-09-14")
TourDate.create!(:city => "Pittsburgh", :state => "PA", :venue => "First Niagara Pavilion", :date => "2011-09-16")
TourDate.create!(:city => "Indianapolis", :state => "IN", :venue => "Verizon Wireless Amphitheatre", :date => "2011-09-17")
TourDate.create!(:city => "Chicago", :state => "IL", :venue => "First Midwest Pavillion", :date => "2011-09-18")
TourDate.create!(:city => "Grand Rapids", :state => "MI", :venue => "Van Andel Arena", :date => "2011-09-20")
TourDate.create!(:city => "Cleveland", :state => "OH", :venue => "Blossom Music Center", :date => "2011-09-21")
TourDate.create!(:city => "Kansas City", :state => "MO", :venue => "Sandstone Amphitheater", :date => "2011-09-24")
TourDate.create!(:city => "St Louis", :state => "MO", :venue => "Verizon Wireless Amphitheatre", :date => "2011-09-25")
TourDate.create!(:city => "Calgary", :state => "AB", :venue => "Saddledome", :date => "2011-09-28")
TourDate.create!(:city => "Edmonton", :state => "AB", :venue => "Rexall Place", :date => "2011-09-29")
# October Tour Dates
TourDate.create!(:city => "Auburn", :state => "WA", :venue => "White River Amphitheatre", :date => "2011-10-01")
TourDate.create!(:city => "Spokane", :state => "WA", :venue => "Spokane Arena", :date => "2011-10-02")
TourDate.create!(:city => "West Valley City", :state => "UT", :venue => "USANA Amphitheater", :date => "2011-10-04")
TourDate.create!(:city => "Denver", :state => "CO", :venue => "Comfort Dental Amphitheater", :date => "2011-10-05")
TourDate.create!(:city => "Albuquerque", :state => "NM", :venue => "Hard Rock Pavilion", :date => "2011-10-07")
TourDate.create!(:city => "Phoenix", :state => "AZ", :venue => "Ashley Furniture Home Store Pavilion", :date => "2011-10-08")
TourDate.create!(:city => "San Diego", :state => "CA", :venue => "Cricket Wireless Amphitheatre", :date => "2011-10-09")
TourDate.create!(:city => "Sacramento", :state => "CA", :venue => "Sleep Train Amphitheatre", :date => "2011-10-13")
TourDate.create!(:city => "Mountain View", :state => "CA", :venue => "Shoreline Amphitheater", :date => "2011-10-14")
puts "#{TourDate.count} tour dates created"