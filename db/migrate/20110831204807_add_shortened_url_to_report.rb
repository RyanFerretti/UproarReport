class AddShortenedUrlToReport < ActiveRecord::Migration
  def self.up
    add_column :reports, :public_url, :string
  end

  def self.down
    remove_column :reports, :public_url
  end
end
