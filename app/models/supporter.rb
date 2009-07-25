class Supporter < ActiveRecord::Base
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
  validates_presence_of :name, :if => lambda { |supporter| supporter.pledged_public_support }

  named_scope :public, {:conditions => {:pledged_public_support => true}}
end
