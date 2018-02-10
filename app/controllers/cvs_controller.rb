class CvsController < ApplicationController
  before_action :set_cv, only: %i[show edit update destroy]

  # GET /cvs
  # GET /cvs.json
  def index
    @cvs = Cv.all
  end

  # GET /cvs/1
  # GET /cvs/1.json
  def show; end

  # GET /cvs/new
  def new
    @user = current_user
    @cv = @user.build_cv
  end

  # GET /cvs/1/edit
  def edit; end

  # POST /cvs
  # POST /cvs.json
  def create
    @user = current_user
    @cv = @user.create_cv(cv_params)

    respond_to do |format|
      if @cv.save
        format.html { redirect_to @cv, notice: 'Cv was successfully created.' }
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
    @cv = Cv.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def cv_params
    params.require(:cv).permit(:user_id, :first_name, :middle_name, :last_name, :age, :height, :weight, :marital_status, :children, :phone_number, :current_address_L1, :current_address_L2, :current_city, :current_country, :skills, :work_visa, :visa_exp_date, :nationality)
  end

  
end
