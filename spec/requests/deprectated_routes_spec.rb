require 'rails_helper'

RSpec.describe 'deprecated routes', type: :request do
  describe '/problems' do
    it 'redirects to /possibilities' do
      get '/problems'
      expect(response).to redirect_to('/possibilities')
    end
  end
end
