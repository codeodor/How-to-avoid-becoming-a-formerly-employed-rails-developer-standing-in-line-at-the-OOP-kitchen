class ResourceListsController < ApplicationController
  # GET /resource_lists
  # GET /resource_lists.json
  def index
    @resource_lists = ResourceList.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @resource_lists }
    end
  end

  # GET /resource_lists/1
  # GET /resource_lists/1.json
  def show
    @resource_list = ResourceList.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @resource_list }
    end
  end

  # GET /resource_lists/new
  # GET /resource_lists/new.json
  def new
    @resource_list = ResourceList.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @resource_list }
    end
  end

  # GET /resource_lists/1/edit
  def edit
    @resource_list = ResourceList.find(params[:id])
  end

  # POST /resource_lists
  # POST /resource_lists.json
  def create
    @resource_list = ResourceList.new(params[:resource_list])

    respond_to do |format|
      if @resource_list.save
        format.html { redirect_to @resource_list, notice: 'Resource list was successfully created.' }
        format.json { render json: @resource_list, status: :created, location: @resource_list }
      else
        format.html { render action: "new" }
        format.json { render json: @resource_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /resource_lists/1
  # PUT /resource_lists/1.json
  def update
    @resource_list = ResourceList.find(params[:id])

    respond_to do |format|
      if @resource_list.update_attributes(params[:resource_list])
        format.html { redirect_to @resource_list, notice: 'Resource list was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @resource_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resource_lists/1
  # DELETE /resource_lists/1.json
  def destroy
    @resource_list = ResourceList.find(params[:id])
    @resource_list.destroy

    respond_to do |format|
      format.html { redirect_to resource_lists_url }
      format.json { head :no_content }
    end
  end
end
