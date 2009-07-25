class AddNameAndMessageToSupporter < ActiveRecord::Migration
  def self.up
    add_column :supporters, :name, :string
    add_column :supporters, :message, :text
  end

  def self.down
    remove_column :supporters, :name
    remove_column :supporters, :message
  end
end
