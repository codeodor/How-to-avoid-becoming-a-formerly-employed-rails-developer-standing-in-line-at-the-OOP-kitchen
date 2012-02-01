class StudyGroupsController < ApplicationController
  # GET /study_groups
  # GET /study_groups.json
  def index
    @study_groups = StudyGroup.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @study_groups }
    end
  end

  # GET /study_groups/1
  # GET /study_groups/1.json
  def show
    @study_group = StudyGroup.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @study_group }
    end
  end

  # GET /study_groups/new
  # GET /study_groups/new.json
  def new
    @study_group = StudyGroup.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @study_group }
    end
  end

  # GET /study_groups/1/edit
  def edit
    @study_group = StudyGroup.find(params[:id])
  end

  # POST /study_groups
  # POST /study_groups.json
  def create
    @study_group = StudyGroup.new(params[:study_group])

    respond_to do |format|
      if @study_group.save
        format.html { redirect_to @study_group, notice: 'Study group was successfully created.' }
        format.json { render json: @study_group, status: :created, location: @study_group }
      else
        format.html { render action: "new" }
        format.json { render json: @study_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /study_groups/1
  # PUT /study_groups/1.json
  def update
    @study_group = StudyGroup.find(params[:id])

    respond_to do |format|
      if @study_group.update_attributes(params[:study_group])
        format.html { redirect_to @study_group, notice: 'Study group was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @study_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /study_groups/1
  # DELETE /study_groups/1.json
  def destroy
    @study_group = StudyGroup.find(params[:id])
    @study_group.destroy

    respond_to do |format|
      format.html { redirect_to study_groups_url }
      format.json { head :no_content }
    end
  end
end
