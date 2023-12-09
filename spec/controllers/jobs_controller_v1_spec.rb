require 'rails_helper'

RSpec.describe Api::V1::JobsController, type: :controller do

  before{@job = Job.create(name: 'dba', wage: '5000')}

  describe 'GET /api/v1/jobs' do
    it 'Consegue listar todos os jobs e retornar status 200?' do
      get :index
      expect(JSON.parse(response.body).size).to eq(1)
      expect(response).to have_http_status(200)
    end
  end

end