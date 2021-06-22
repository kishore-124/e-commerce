require 'rails_helper'

RSpec.describe ProductsController, type: :controller do

  describe 'GET #index' do
    before do
      get :index
    end
    it 'returns a success response' do
      expect(response).to have_http_status(:success)
    end

    it 'returns a rendered template format' do
      expect(response.content_type).to eq 'text/html; charset=utf-8'
      expect(response).to render_template('index')
    end
    it 'assigns @products' do
      topic = Product.create!(name: 'anything')
      expect(assigns(:products)).to eq([topic])
    end
  end


  describe 'GET #show' do
    before do
      product = Product.create(name: 'Anything')
      get :show, params: {id: product.to_param}
    end
    it 'returns a content type' do
      expect(response.content_type).to eq 'text/html; charset=utf-8'
      expect(response).to render_template('show')
    end
    it 'returns a success response' do
      expect(response).to have_http_status(:success)
    end
  end
end