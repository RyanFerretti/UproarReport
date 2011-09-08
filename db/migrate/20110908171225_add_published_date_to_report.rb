class AddPublishedDateToReport < ActiveRecord::Migration
  def self.up
    add_column :reports, :published_at, :datetime
  end

  def self.down
    remove_column :reports, :published_at
  end
end
