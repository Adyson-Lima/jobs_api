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

  describe 'GET /api/v1/jobs/id' do
    it 'Consegue listar um job especifico e retornar status 200?' do
      get :show, params: {id: @job.id}
      expect(response.body).to include_json(id: @job.id)
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /api/v1/jobs' do
    it 'Consegue criar um job e retornar status 201?' do
      post :create, params: {job: {name: 'devop', wage: '4000'},format: :json}
      expect(response.body).to include_json(name: 'devop')
      expect(response).to have_http_status(201)
    end
  end

end