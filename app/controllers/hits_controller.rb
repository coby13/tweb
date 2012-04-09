class HitsController < ApplicationController
before_filter :authenticate_user!

  # GET /hits
  # GET /hits.json
  def index
    @search = Hit.search(params[:search])
    @hits = @search.page(params[:page])
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @hits }
    end
  end

 def search
   @asearch = Hit.search(params[:search])
    @hits = @asearch.page(params[:page])
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @hits }
    end
  end



  def myhits
    @mysearch = Hit.where("user_id = ?", current_user.id).search(params[:search])
    @hits = @mysearch.page(params[:page])
    respond_to do |format|
      format.html # myhits.html.erb
      format.json { render json: @hits }
    end
  end


  # GET /hits/1
  # GET /hits/1.json
  def show
    @hit = Hit.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @hit }
    end
  end

  # GET /hits/new
  # GET /hits/new.json
  def new
    @hit = Hit.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @hit }
    end
  end

  # GET /hits/1/edit
  def edit
    @hit = Hit.find(params[:id])
  end

  # POST /hits
  # POST /hits.json
  def create
    @hit = Hit.new(params[:hit])

    respond_to do |format|
      if @hit.save
        format.html { redirect_to @hit, notice: 'Hit was successfully created.' }
        format.json { render json: @hit, status: :created, location: @hit }
      else
        format.html { render action: "new" }
        format.json { render json: @hit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /hits/1
  # PUT /hits/1.json
  def update
    @hit = Hit.find(params[:id])

    respond_to do |format|
      if @hit.update_attributes(params[:hit])
        format.html { redirect_to @hit, notice: 'Hit was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @hit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hits/1
  # DELETE /hits/1.json
  def destroy
    @hit = Hit.find(params[:id])
    @hit.destroy

    respond_to do |format|
      format.html { redirect_to '/myhits',notice: 'Hit was successfully deleted.' }
      format.json { head :no_content }
    end
  end
end
