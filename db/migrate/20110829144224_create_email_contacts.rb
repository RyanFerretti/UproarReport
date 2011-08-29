class CreateEmailContacts < ActiveRecord::Migration
  def self.up
    create_table :email_contacts do |t|
      t.references :company
      t.string :email
      t.timestamps
    end
  end

  def self.down
    drop_table :email_contacts
  end
end
