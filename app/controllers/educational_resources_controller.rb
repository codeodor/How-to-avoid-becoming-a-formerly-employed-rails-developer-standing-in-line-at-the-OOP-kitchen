class EducationalResourcesController < ApplicationController
  # GET /educational_resources
  # GET /educational_resources.json
  def index
    @educational_resources = EducationalResource.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @educational_resources }
    end
  end

  # GET /educational_resources/1
  # GET /educational_resources/1.json
  def show
    @educational_resource = EducationalResource.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @educational_resource }
    end
  end

  # GET /educational_resources/new
  # GET /educational_resources/new.json
  def new
    @educational_resource = EducationalResource.new(resource_list_id: params[:resource_list_id])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @educational_resource }
    end
  end

  # GET /educational_resources/1/edit
  def edit
    @educational_resource = EducationalResource.find(params[:id])
  end

  # POST /educational_resources
  # POST /educational_resources.json
  def create
    params[:educational_resource][:resource_list_id] = params[:resource_list_id]
    @educational_resource = EducationalResource.new(params[:educational_resource])

    respond_to do |format|
      if @educational_resource.save
        format.html { redirect_to [@educational_resource.resource_list, @educational_resource], notice: 'Educational resource was successfully created.' }
        format.json { render json: @educational_resource, status: :created, location: @educational_resource }
      else
        format.html { render action: "new" }
        format.json { render json: @educational_resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /educational_resources/1
  # PUT /educational_resources/1.json
  def update
    @educational_resource = EducationalResource.find(params[:id])

    respond_to do |format|
      if @educational_resource.update_attributes(params[:educational_resource])
        format.html { redirect_to [@educational_resource.resource_list, @educational_resource], notice: 'Educational resource was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @educational_resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /educational_resources/1
  # DELETE /educational_resources/1.json
  def destroy
    @educational_resource = EducationalResource.find(params[:id])
    @educational_resource.destroy

    respond_to do |format|
      format.html { redirect_to resource_list_educational_resources_url(@educational_resource.resource_list) }
      format.json { head :no_content }
    end
  end
end
