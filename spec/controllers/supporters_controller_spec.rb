require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SupportersController do
  integrate_views

  describe "GET new" do
    it "should provide a sign-up screen" do
      get :new
      response.body.should include("Sign up to FixMta.org")
    end
  end

  describe "POST create" do
    it "should create a new supporter" do
      lambda { 
        post :create, {:supporter => {:email => Faker::Internet.email}}
      }.should change(Supporter, :count).by(1)
      response.should redirect_to(:controller => "home", :action => "index")
    end

    it "should not create a supporter who has pledged public support but has not provided a name" do
      lambda {
        post :create, {:supporter => {:email => Faker::Internet.email, :pledged_public_support => true}}
      }.should_not change(Supporter, :count)
      response.should redirect_to(:action => "new")       
    end
  end
end
