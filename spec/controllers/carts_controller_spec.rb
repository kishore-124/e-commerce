require 'rails_helper'

RSpec.describe CartsController, type: :controller do

  let(:customer) { Customer.create(email: 'test@gmail.com', password: '904744', name: "test", address: "test") }

  describe 'GET #index' do
    before do
      sign_in(customer)
      get :index
    end
    it 'returns a success response' do
      expect(response).to have_http_status(:success)
    end

    it 'returns a rendered template format' do
      expect(response.content_type).to eq 'text/html; charset=utf-8'
      expect(response).to render_template('index')
    end
  end
end