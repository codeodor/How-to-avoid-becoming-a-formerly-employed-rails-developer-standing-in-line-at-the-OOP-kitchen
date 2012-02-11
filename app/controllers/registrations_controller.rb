class RegistrationsController < ApplicationController
  # GET /registrations
  # GET /registrations.json
  def index
    @registrations = Registration.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @registrations }
    end
  end

  # GET /registrations/1
  # GET /registrations/1.json
  def show
    @registration = Registration.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @registration }
    end
  end

  # GET /registrations/new
  # GET /registrations/new.json
  def new
    @registration = Registration.new(section_id: params[:section_id])
    @registration.registration_fee = @registration.section.registration_fee
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @registration }
    end
  end

  # GET /registrations/1/edit
  def edit
    @registration = Registration.find(params[:id])
  end

  # POST /registrations
  # POST /registrations.json
  def create
    @registration = Registration.new(params[:registration])
    @registration.section_id = params[:section_id]
    
    unless current_user.admin?
      @registration.registration_fee = @registration.section.registration_fee
    end
    
    if params[:registration][:study_group_id].to_s.length == 0
      study_group = StudyGroup.create!(params[:study_group])
      @registration.study_group = study_group
    end
    
    if params[:scholarship_code].to_s.length > 0
      code = ScholarshipCode.find_by_department_id_and_code(@registration.section.course.department, params[:scholarship_code])
      if code
        if code.discount_type == ScholarshipCode::DiscountTypes[:PERCENT][:id]
          if code.discount_amount > 1
            discount = @registration.registration_fee * code.discount_amount / 100
          else
            discount = @registration.registration_fee * code.discount_amount
          end
        else
          discount = code.discount_amount
        end
        @registration.registration_fee -= discount
        @registration.scholarship_code = code
      end
    end
    
    respond_to do |format|
      if @registration.save
        format.html { redirect_to [@registration.section.course.department, @registration.section.course, @registration.section, @registration], notice: 'Registration was successfully created.' }
        format.json { render json: @registration, status: :created, location: @registration }
      else
        format.html { render action: "new" }
        format.json { render json: @registration.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /registrations/1
  # PUT /registrations/1.json
  def update
    @registration = Registration.find(params[:id])
    
    if params[:registration][:study_group_id].to_s.length == 0
      study_group = StudyGroup.create!(params[:study_group])
      @registration.study_group = study_group
    end
    
    respond_to do |format|
      if @registration.update_attributes(params[:registration])
        format.html { redirect_to [@registration.section.course.department, @registration.section.course, @registration.section, @registration], notice: 'Registration was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @registration.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /registrations/1
  # DELETE /registrations/1.json
  def destroy
    @registration = Registration.find(params[:id])
    @registration.destroy

    respond_to do |format|
      format.html { redirect_to department_course_section_registrations_path(@registration.section.course.department, @registration.section.course, @registration.section) }
      format.json { head :no_content }
    end
  end
end
