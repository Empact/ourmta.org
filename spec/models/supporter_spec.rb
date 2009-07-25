require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Supporter do
  before(:each) do
    @valid_attributes = {
      
    }
  end

  it "should create a new instance given valid attributes" do
    create_supporter.should be_valid
  end

  describe ".public" do
    it "should return users who have publicly pledged their support" do
      create_supporter(:pledged_public_support => false)
      create_supporter(:pledged_public_support => true)

      Supporter.public.count.should == 1
    end
  end
end
