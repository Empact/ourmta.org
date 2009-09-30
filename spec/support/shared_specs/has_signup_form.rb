describe "has sign-up screen", :shared => true do
  it "should provide a sign-up screen" do
    do_get
    response.body.should include("Sign up to OurMTA")
  end
end