class CreateSupporters < ActiveRecord::Migration
  def self.up
    create_table :supporters do |t|
      t.string :email
      t.timestamps
    end
  end

  def self.down
    drop_table :supporters
  end
end
