require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe InformationController do
  integrate_views

  describe "GET index" do
    def do_get
      get :index
    end

    it "should return the home page" do
      do_get
      response.body.should include("Welcome to FixMTA")
    end

    it_should_behave_like "has sign-up screen"
  end

  describe "GET problems" do
    def do_get
      get :problems
    end
    it_should_behave_like "has sign-up screen"
  end

  describe "GET problems" do
    def do_get
      get :people
    end
    it_should_behave_like "has sign-up screen"
  end

  describe "GET possibilities" do
    def do_get
      get :possibilities
    end
    it_should_behave_like "has sign-up screen"
  end

  describe "GET suggestions" do
    def do_get
      get :suggestions
    end
    it_should_behave_like "has sign-up screen"
  end

end
