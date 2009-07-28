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
    def do_post(supporter_attrs = {})
      post :create, {:supporter => supporter_attrs.reverse_merge(:email => Faker::Internet.email)}
    end

    it "should create a new supporter" do
      lambda {
        do_post
      }.should change(Supporter, :count).by(1)
    end

    it "should redirect to home" do
      do_post
      response.should redirect_to(:controller => "home", :action => "index")
    end

    context "when the same email address has already been submitted" do
      def signup_duplicate_email
        do_post(:email => 'bob@mta.info')
        do_post(:email => 'bob@mta.info')
      end

      it "should not include an ugly 'prohibited this user message'" do
        signup_duplicate_email
        response.body.should_not include("error prohibited this supporter from being saved")
      end

      it "should notify the user to check their spam filter" do
        signup_duplicate_email
        response.body.should include("Email has already been submitted.  If you haven't caught word from us, check to see that our messages aren't being sent to your spam filter!")
      end

      it "should notify the user at the provided email address (with update links)"
    end

    context "when the user has pledged public support" do
      context "but has not provided a name" do
        it "should not create a supporter" do
          lambda {
            do_post :pledged_public_support => true
          }.should_not change(Supporter, :count)
          response.body.should include("Name must be present if you are pledging public support")       
        end
      end
    end
  end
end
