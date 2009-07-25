class AddPledgedPublicSupportToSupporters < ActiveRecord::Migration
  def self.up
    add_column :supporters, :pledged_public_support, :boolean, :default => false
  end

  def self.down
    remove_column :supporters, :pledged_public_support
  end
end
