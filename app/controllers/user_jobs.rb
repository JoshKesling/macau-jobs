class UserJobsController < ApplicationController
  def add
    @user = current_user
    @job = Job.find(params[:id])
    @user << @job
    redirect_to @job
end