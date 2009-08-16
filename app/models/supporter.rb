class Supporter < ActiveRecord::Base
  validates_format_of :email,
                      :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i,
                      :on => :create,
                      :message => "must be valid"
  validates_presence_of :name,
                        :if => lambda { |supporter| supporter.pledged_public_support },
                        :message => "must be present if you are pledging public support"
  validates_uniqueness_of :email, :message => "has already been submitted.  If you haven't caught word from us, check to see that our messages aren't being sent to your spam filter!"

  named_scope :public, {:conditions => {:pledged_public_support => true}}

  after_create CampaignMonitorStorage.new(ENV['CAMPAIGN_MONITOR_FIXMTA_SUPPORTER_LIST_ID']) if Rails.env == 'production'
end
