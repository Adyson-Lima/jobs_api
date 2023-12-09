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

  describe 'PATCH /api/v1/jobs/id' do
    it 'Consegue atualizar um job e retornar status 200?' do
      job = Job.last
      patch :update, params: {job: {name: 'Rails dev', wage: '5000'}, id: job.id}
      expect(response.body).to include_json(name: 'Rails dev')
      expect(response).to have_http_status(200)
    end
  end

  describe 'DELETE /api/v1/jobs/id' do
    it 'Consegue excluir um job e retornar status 204?' do
      job = Job.last
      delete :destroy, params: {id: job.id}
      expect(Job.all).not_to include(job)
      expect(response).to have_http_status(204)
    end
  end

end