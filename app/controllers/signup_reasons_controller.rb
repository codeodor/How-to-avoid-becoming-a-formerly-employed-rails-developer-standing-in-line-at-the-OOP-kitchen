class SignupReasonsController < ApplicationController
  # GET /signup_reasons
  # GET /signup_reasons.json
  def index
    @signup_reasons = SignupReason.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @signup_reasons }
    end
  end

  # GET /signup_reasons/1
  # GET /signup_reasons/1.json
  def show
    @signup_reason = SignupReason.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @signup_reason }
    end
  end

  # GET /signup_reasons/new
  # GET /signup_reasons/new.json
  def new
    @signup_reason = SignupReason.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @signup_reason }
    end
  end

  # GET /signup_reasons/1/edit
  def edit
    @signup_reason = SignupReason.find(params[:id])
  end

  # POST /signup_reasons
  # POST /signup_reasons.json
  def create
    @signup_reason = SignupReason.new(params[:signup_reason])

    respond_to do |format|
      if @signup_reason.save
        format.html { redirect_to @signup_reason, notice: 'Signup reason was successfully created.' }
        format.json { render json: @signup_reason, status: :created, location: @signup_reason }
      else
        format.html { render action: "new" }
        format.json { render json: @signup_reason.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /signup_reasons/1
  # PUT /signup_reasons/1.json
  def update
    @signup_reason = SignupReason.find(params[:id])

    respond_to do |format|
      if @signup_reason.update_attributes(params[:signup_reason])
        format.html { redirect_to @signup_reason, notice: 'Signup reason was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @signup_reason.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /signup_reasons/1
  # DELETE /signup_reasons/1.json
  def destroy
    @signup_reason = SignupReason.find(params[:id])
    @signup_reason.destroy

    respond_to do |format|
      format.html { redirect_to signup_reasons_url }
      format.json { head :no_content }
    end
  end
end
