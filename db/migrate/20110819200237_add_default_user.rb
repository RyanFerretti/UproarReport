class AddDefaultUser < ActiveRecord::Migration
  def self.up
    User.create!(:email => 'admin@example.com', :password => 'password', :password_confirmation => 'password', :role => User::ADMIN)
  end

  def self.down
    # nothing
  end
end
