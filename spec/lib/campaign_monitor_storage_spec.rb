require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
require 'lib/campaign_monitor_storage'

describe CampaignMonitorStorage do
  it "should add the passed-in user to the provided list" do
    cm = CampaignMonitorStorage.new(ENV['CAMPAIGN_MONITOR_TEST_LIST_ID'])
    
    supporter = create_supporter
    
    cm.after_create(supporter)['Result']['Code'].should == '0'
  end
end