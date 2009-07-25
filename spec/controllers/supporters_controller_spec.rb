require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SupportersController do
  integrate_views

  describe "GET new" do
    it "should provide a sign-up screen" do
      get :new
      response.body.should include("Sign up to FixMta.org")
    end
  end
end
