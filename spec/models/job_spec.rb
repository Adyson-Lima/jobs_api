require 'rails_helper'

RSpec.describe Job, type: :model do

  before{@job = Job.new}

  describe 'Testes de preenchimento do model Job' do

    it 'name consegue ser preenchido?' do
      @job.name = ''
      expect(@job.name).to eq('programmer')
    end

  end

end