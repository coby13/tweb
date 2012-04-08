class BidsController < ApplicationController
before_filter :authenticate_user!

  # GET /bids
  # GET /bids.json



  def index
    @bids = Bid.where("hit_id = ?", params[:hit_id]).page(params[:page])
    @userbids = @bids.count
    @hit = Hit.find(params[:hit_id])
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bids }
    end
  end

def mybids
    @bids = Bid.where("user_id = ?", current_user.id).page(params[:page])
    @userbids = @bids.count

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @hits }
    end
  end


  # GET /bids/1
  # GET /bids/1.json
  def show
    @bid = Bid.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bid }
    end
  end

  # GET /bids/new
  # GET /bids/new.json
  def new

@bid = Bid.new(:hit_id => params[:hit_id])
@mobids = @bid.hit.bids.average('size')
@currentbids = @bid.hit.bids
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bid }
    end
  end

  # GET /bids/1/edit
  def edit
    @bid = Bid.find(params[:id])
  end

  # POST /bids
  # POST /bids.json
  def create
    @bid = Bid.new(params[:bid])

    respond_to do |format|
      if @bid.save
        format.html { redirect_to @bid, notice: 'Bid was successfully created.' }
        format.json { render json: @bid, status: :created, location: @bid }
      else
        format.html { render action: "new" }
        format.json { render json: @bid.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /bids/1
  # PUT /bids/1.json
  def update
    @bid = Bid.find(params[:id])

    respond_to do |format|
      if @bid.update_attributes(params[:bid])
        format.html { redirect_to @bid, notice: 'Bid was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @bid.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bids/1
  # DELETE /bids/1.json
  def destroy
    @bid = Bid.find(params[:id])
    @bid.destroy
    flash[:notice] = "Successfully destroyed post."
    respond_to do |format|
      format.html { redirect_to "/mybids" }
      format.json { head :no_content }
    end
  end


 def inactive
    @bid = Bid.find(params[:id])
    @bid.update_attribute(:active, false)
end

  def accept
    @bid = Bid.find(params[:id])
    @hit = @bid.hit
    @hit.update_attribute(:haveaccept, true)
    @bid.update_attribute(:accept, true)
    @bid.hit.bids.each do |rejected_bid|
      rejected_bid.update_attribute(:active, false) unless rejected_bid == @bid   # destroys all be the accepted bid
    end

    flash[:notice] = "Successfully destroyed post."
    respond_to do |format|
      format.html { redirect_to "/mybids" }
      format.json { head :no_content }
    end
  end

end
