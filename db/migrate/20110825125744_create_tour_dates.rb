class CreateTourDates < ActiveRecord::Migration
  def self.up
    create_table :tour_dates do |t|
      t.string :city, :limit => 50
      t.string :state, :limit => 2
      t.string :venue, :limit => 50
      t.date :date

      t.timestamps
    end
  end

  def self.down
    drop_table :tour_dates
  end
end
