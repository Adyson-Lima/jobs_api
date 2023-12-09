require 'rails_helper'

RSpec.describe Job, type: :model do

  before{@job = Job.new}

  describe 'Testes de preenchimento do model Job' do

    it 'name consegue ser preenchido?' do
      @job.name = 'programmer'
      expect(@job.name).to eq('programmer')
    end

    it 'wage consegue ser preenchido?' do
      @job.wage = '5000'
      expect(@job.wage).to eq('5000')
    end

  end

  describe 'Testes de validação do model Job' do

    it 'job valido com campos obrigatorios preenchidos?' do
      @job.name = 'frontend designer'
      @job.wage = '4000'
      expect(@job).to be_valid
    end

    it 'job invalido com campos obrigatorios não preenchidos?' do
      job = Job.new
      expect(job).to be_valid
    end

  end

end