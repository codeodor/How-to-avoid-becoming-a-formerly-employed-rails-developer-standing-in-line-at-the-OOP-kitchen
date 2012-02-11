class ScholarshipCodesController < ApplicationController
  # GET /scholarship_codes
  # GET /scholarship_codes.json
  def index
    @scholarship_codes = ScholarshipCode.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @scholarship_codes }
    end
  end

  # GET /scholarship_codes/1
  # GET /scholarship_codes/1.json
  def show
    @scholarship_code = ScholarshipCode.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @scholarship_code }
    end
  end

  # GET /scholarship_codes/new
  # GET /scholarship_codes/new.json
  def new
    @scholarship_code = ScholarshipCode.new
    @scholarship_code.department_id = params[:department_id]
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @scholarship_code }
    end
  end

  # GET /scholarship_codes/1/edit
  def edit
    @scholarship_code = ScholarshipCode.find(params[:id])
  end

  # POST /scholarship_codes
  # POST /scholarship_codes.json
  def create
    @scholarship_code = ScholarshipCode.new(params[:scholarship_code])

    respond_to do |format|
      if @scholarship_code.save
        format.html { redirect_to [@scholarship_code.department, @scholarship_code], notice: 'Scholarship code was successfully created.' }
        format.json { render json: @scholarship_code, status: :created, location: @scholarship_code }
      else
        format.html { render action: "new" }
        format.json { render json: @scholarship_code.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /scholarship_codes/1
  # PUT /scholarship_codes/1.json
  def update
    @scholarship_code = ScholarshipCode.find(params[:id])

    respond_to do |format|
      if @scholarship_code.update_attributes(params[:scholarship_code])
        format.html { redirect_to [@scholarship_code.department, @scholarship_code], notice: 'Scholarship code was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @scholarship_code.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scholarship_codes/1
  # DELETE /scholarship_codes/1.json
  def destroy
    @scholarship_code = ScholarshipCode.find(params[:id])
    @scholarship_code.destroy

    respond_to do |format|
      format.html { redirect_to department_scholarship_codes_url(@scholarship_code.department) }
      format.json { head :no_content }
    end
  end
end
