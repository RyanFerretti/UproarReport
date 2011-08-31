class CreateTourReports < ActiveRecord::Migration
  def self.up
    create_table :tour_reports do |t|
      t.references :tour_date
      t.references :user
      t.string :description
      t.timestamps
    end
  end

  def self.down
    drop_table :tour_reports
  end
end
