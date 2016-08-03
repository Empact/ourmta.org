require 'rails_helper'

RSpec.describe ActionsController, type: :controller do
  render_views

  describe "GET suggestions" do
    def do_get
      get :suggestions
    end

    it 'renders' do
      do_get
      expect(response).to be_success
    end
  end

  describe "GET stories" do
    def do_get
      get :stories
    end

    it 'renders' do
      do_get
      expect(response).to be_success
    end
  end
end
