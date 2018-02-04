class JobsController < ApplicationController
  before_action :set_job, only: %i[show edit update destroy]
  before_action :get_agents, only: %i[new create edit update]
  before_action :set_page_title, only: %i[new show index edit]
  before_action :set_partial_to_render, only: %i[new edit]

  # GET /jobs
  # GET /jobs.json
  def index
    @jobs = Job.all.order('created_at DESC')
  end

  # GET /jobs/1
  # GET /jobs/1.json
  def show; end

  # GET /jobs/new
  def new
    @job = Job.new
  end

  # GET /jobs/1/edit
  def edit; end

  # POST /jobs
  # POST /jobs.json
  def create
    @job = Job.new(job_params)

    respond_to do |format|
      if @job.save
        format.html { redirect_to @job, notice: 'Job was successfully created.' }
        format.json { render :show, status: :created, location: @job }
      else
        format.html { render :new }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jobs/1
  # PATCH/PUT /jobs/1.json
  def update
    respond_to do |format|
      if @job.update(job_params)
        format.html { redirect_to @job, notice: 'Job was successfully updated.' }
        format.json { render :show, status: :ok, location: @job }
      else
        format.html { render :edit }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jobs/1
  # DELETE /jobs/1.json
  def destroy
    @job.destroy
    respond_to do |format|
      format.html { redirect_to jobs_url, notice: 'Job was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_job
    @job = Job.find(params[:id])
  end

  def set_page_title
    @page_title = case action_name
      when 'index'
        'We Need People to Fill These Jobs'
      when 'show'
        @job.title
      when 'edit'
        'Make Changes to This Job Post'
      when 'new'
        'Create a New Job Post'
      else
        ''
    end
  end

  def set_partial_to_render
    @partial_to_render = 'form'
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def job_params
    params.require(:job).permit(:title, :body, :open, :closed_date, :summary, :agent)
  end

  def get_agents
    @agent_list = Agent.all
  end
end
