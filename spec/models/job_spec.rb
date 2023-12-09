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

end