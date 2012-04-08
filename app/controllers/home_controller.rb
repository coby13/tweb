class HomeController < ApplicationController
    def index
    @search = Hit.search(params[:search])
    @hits = @search.page(params[:page])
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @hits }
    end
  end
end
