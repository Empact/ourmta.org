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
  end
end
