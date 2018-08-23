require 'rails_helper'

RSpec.describe InformationController, type: :controller do
  render_views

  describe "GET index" do
    def do_get
      get :index
    end

    it "should return the home page" do
      do_get
      expect(response).to be_successful
      expect(response.body).to include("Our Vision of the Future")
    end
  end

  describe "GET people" do
    def do_get
      get :people
    end

    it 'renders' do
      do_get
      expect(response).to be_successful
    end
  end

  describe "GET possibilities" do
    def do_get
      get :possibilities
    end

    it 'renders' do
      do_get
      expect(response).to be_successful
    end
  end
end
