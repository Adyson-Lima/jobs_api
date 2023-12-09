class Api::V1::JobsController < ApplicationController

  before_action :set_job, only: %i[show] #show update destroy

  def index
    @jobs = Job.all 
    render json: @jobs
  end

  def show
    render json: @job
  end

private

def set_job
  @job = Job.find(params[:id])
end

def job_params
  params.require(:job).permit(:name, :wage)
end

end