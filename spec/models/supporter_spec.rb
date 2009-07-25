require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Supporter do
  before(:each) do
    @valid_attributes = {
      
    }
  end

  it "should create a new instance given valid attributes" do
    create_supporter.should be_valid
  end
end
