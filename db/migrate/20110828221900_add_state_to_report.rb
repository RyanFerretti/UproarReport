class AddStateToReport < ActiveRecord::Migration
  def self.up
    add_column :reports, :state, :string, :limit => 20
  end

  def self.down
    remove_column :reports, :state
  end
end
