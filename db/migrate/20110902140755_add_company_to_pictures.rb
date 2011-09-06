class AddCompanyToPictures < ActiveRecord::Migration
  def self.up
    add_column :pictures, :company_id, :integer
  end

  def self.down
    remove_column :pictures, :company_id
  end
end
