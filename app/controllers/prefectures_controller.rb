class PrefecturesController < ApplicationController
  # GET /prefectures
  # GET /prefectures.json
  def index
    @prefectures = Prefecture.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @prefectures }
    end
  end

  # GET /prefectures/1
  # GET /prefectures/1.json
  def show
    @prefecture = Prefecture.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @prefecture }
    end
  end

  # GET /prefectures/new
  # GET /prefectures/new.json
  def new
    @prefecture = Prefecture.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @prefecture }
    end
  end

  # GET /prefectures/1/edit
  def edit
    @prefecture = Prefecture.find(params[:id])
  end

  # POST /prefectures
  # POST /prefectures.json
  def create
    @prefecture = Prefecture.new(params[:prefecture])

    respond_to do |format|
      if @prefecture.save
        format.html { redirect_to @prefecture, notice: 'Prefecture was successfully created.' }
        format.json { render json: @prefecture, status: :created, location: @prefecture }
      else
        format.html { render action: "new" }
        format.json { render json: @prefecture.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /prefectures/1
  # PUT /prefectures/1.json
  def update
    @prefecture = Prefecture.find(params[:id])

    respond_to do |format|
      if @prefecture.update_attributes(params[:prefecture])
        format.html { redirect_to @prefecture, notice: 'Prefecture was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @prefecture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /prefectures/1
  # DELETE /prefectures/1.json
  def destroy
    @prefecture = Prefecture.find(params[:id])
    @prefecture.destroy

    respond_to do |format|
      format.html { redirect_to prefectures_url }
      format.json { head :no_content }
    end
  end
end
