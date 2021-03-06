require 'rails_helper'

RSpec.describe ActionsController, type: :controller do
  render_views

  describe "GET stories" do
    def do_get
      get :stories
    end

    it 'renders' do
      do_get
      expect(response).to be_successful
    end
  end
end
