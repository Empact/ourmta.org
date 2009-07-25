require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe HomeController do
  integrate_views

  describe "GET index" do
    it "should return the home page" do
      get :index
      response.body.should include("Welcome to FixMta.org")
    end
  end

end
