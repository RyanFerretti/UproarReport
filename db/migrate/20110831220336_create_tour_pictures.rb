class CreateTourPictures < ActiveRecord::Migration
  def self.up
    create_table :tour_pictures do |t|
      t.references :tour_date
      t.references :user
      t.string :image_file_name
      t.string :image_content_type
      t.integer :image_file_size
      t.datetime :image_updated_at
      t.timestamps
    end
  end

  def self.down
    drop_table :tour_pictures
  end
end
