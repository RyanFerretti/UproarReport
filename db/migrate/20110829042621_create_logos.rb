class CreateLogos < ActiveRecord::Migration
  def self.up
    create_table :logos do |t|
      t.references :company
      # image
      t.string :image_file_name
      t.string :image_content_type
      t.integer :image_file_size
      t.datetime :image_updated_at
    end
  end

  def self.down
    drop_table :logos
  end
end
