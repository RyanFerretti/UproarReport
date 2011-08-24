# users
User.create!(:email => 'admin@example.com', :password => 'password', :password_confirmation => 'password', :first_name => "admin", :last_name => "person", :role => User::ADMIN)
User.create!(:email => 'company_admin@example.com', :password => 'password', :password_confirmation => 'password', :first_name => "company", :last_name => "admin", :role => User::COMPANY_ADMIN)
User.create!(:email => 'company_rep@example.com', :password => 'password', :password_confirmation => 'password', :first_name => "company", :last_name => "rep", :role => User::COMPANY_REP)
User.create!(:email => 'tour_rep@example.com', :password => 'password', :password_confirmation => 'password', :first_name => "tour", :last_name => "rep", :role => User::TOUR_REP)
puts "#{User.count} users created"