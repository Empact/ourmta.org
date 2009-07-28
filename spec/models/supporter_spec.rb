require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Supporter do
  describe ".public" do
    it "should return users who have publicly pledged their support" do
      create_supporter(:pledged_public_support => false)
      public_supporter = create_supporter(:pledged_public_support => true, :name => Faker::Name.new)

      Supporter.public.should == [public_supporter]
    end
  end

  it "should validate uniqueness of email" do
    create_supporter(:email => 'bob@mta.info')
    new_supporter(:email => 'bob@mta.info').should_not be_valid
  end
end
