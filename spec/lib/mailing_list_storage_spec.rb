require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
require 'lib/mailing_list_storage'

describe MailingListStorage do
  it "should add the passed-in user to the provided list" do
    cm = MailingListStorage.new(ENV['MAIL_CHIMP_TEST_LIST_ID'])

    supporter = create_supporter

    cm.after_create(supporter).should == true
  end
end