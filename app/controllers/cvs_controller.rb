class CvsController < ApplicationController
  # before_action :set_user
  # before_action :set_cv
  before_action :set_language_levels, only: %i[new edit]

  # GET /cvs
  # GET /cvs.json
  def index
    @cvs = Cv.all
  end

  # GET /cvs/1
  # GET /cvs/1.json
  def show
    @cv = current_user.cv
  end

  # GET /cvs/new
  def new
    @cv = current_user.build_cv
    @cv.languages.build(name: 'English', read: 'None', write: 'None', speak: 'None', listen: 'None')
    @cv.languages.build(name: 'Cantonese', read: 'None', write: 'None', speak: 'None', listen: 'None')
    @cv.languages.build(name: 'Mandarin', read: 'None', write: 'None', speak: 'None', listen: 'None')
    @cv.educations.build
    @cv.previous_employments.build
  end

  # GET /cvs/1/edit
  def edit
  end

  # POST /cvs
  # POST /cvs.json
  def create
    @cv = current_user.create_cv(cv_params)
    respond_to do |format|
      if @cv.save
        format.html { redirect_to user_cv_url(current_user, @cv), notice: 'Cv was successfully created.' }
        format.json { render :show, status: :created, location: @cv }
      else
        format.html { render :new }
        format.json { render json: @cv.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cvs/1
  # PATCH/PUT /cvs/1.json
  def update
    respond_to do |format|
      @cv = current_user.cv
      if @cv.update(cv_params)
        format.html { redirect_to user_cv_path, notice: 'Cv was successfully updated.' }
        format.json { render :show, status: :ok, location: @cv }
      else
        format.html { render :edit }
        format.json { render json: @cv.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cvs/1
  # DELETE /cvs/1.json
  def destroy
    @cv.destroy
    respond_to do |format|
      format.html { redirect_to cvs_url, notice: 'Cv was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_cv
    @cv = current_user.cv
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def cv_params
    params.require(:cv).permit(
      :first_name,
      :middle_name,
      :last_name,
      :age,
      :height,
      :weight,
      :marital_status,
      :children,
      :phone_number,
      :current_city,
      :current_country,
      :skills,
      :work_visa,
      :visa_exp_date,
      :visa_country,
      :passport_country,
      :passport_number,
      :passport_expiration_date,
      :head_pic_file_name,
      :head_pic_content_type,
      :head_pic_file_size,
      :head_pic_updated_at,
      :body_pic_file_name,
      :body_pic_content_type,
      :body_pic_file_size,
      :body_pic_updated_at,
      :current_address,
      :completed,
      languages_attributes: [:id,
        :name,
        :read,
        :write,
        :speak,
        :listen,
        :_destroy],
      educations_attributes: [:id,
        :name,
        :city,
        :country,
        :years_attended,
        :year_completed,  
        :months_attended,
        :graduated,
        :_destroy],
      previous_employments_attributes: [:id,
        :employer_name,
        :job_duties,
        :months,
        :years,
        :ended_year, 
        :location,
        :_destroy])
      
  end

  def set_user
    @user = current_user if user_signed_in?
  end

  def set_language_levels
    @language_levels = %w(None Poor Good Perfect)
  end

  def set_end_years
    @end_years = 111
  end

end

