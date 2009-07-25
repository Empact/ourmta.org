class Supporter < ActiveRecord::Base
  validates_presence_of :email
end
