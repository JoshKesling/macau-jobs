class CvsController < ApplicationController
  before_action :set_cv, except: %i[index new create]
  before_action :set_user
  before_action :set_language_levels, only: %i[new edit]

  # GET /cvs
  # GET /cvs.json
  def index
    @cvs = Cv.all
  end

  # GET /cvs/1
  # GET /cvs/1.json
  def show
  end

  # GET /cvs/new
  def new
    @cv = @user.build_cv
    @cv.languages.build(name: 'English')
    @cv.languages.build(name: 'Cantonese')
    @cv.languages.build(name: 'Mandarin')
  end

  # GET /cvs/1/edit
  def edit
  end

  # POST /cvs
  # POST /cvs.json
  def create
    @cv = @user.create_cv(cv_params)
    respond_to do |format|
      if @cv.save
        format.html { redirect_to user_cv_url(@user, @cv), notice: 'Cv was successfully created.' }
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
      if @cv.update(cv_params)
        format.html { redirect_to @cv, notice: 'Cv was successfully updated.' }
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

  protected

  def is_complete?
    self.cv.attributes.each do |atr|
      return false if atr.blank?
    end
    self.cv.educations.each do |edu|
      edu.attributes.each do |ea|
        return false if ea.blank?
      end
    end
    self.cv.languages.each do |exp|
      exp.attributes.each do |exa|
        return false if exa.blank?
      end
    end
    true
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_cv
    @cv = current_user.cv
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def cv_params
    params.require(:cv).permit(:user_id,
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
      languages_attributes: [:name,
        :read,
        :write,
        :speak,
        :listen,
        :_destroy],
      educations_attributes: [:name,
        :city,
        :country,
        :years_attended,
        :year_completed,  
        :months_attended,
        :graduated])
  end

  def set_user
    @user = current_user
  end

  def set_language_levels
    @language_levels = %w(None Poor Good Perfect)
   end
end

