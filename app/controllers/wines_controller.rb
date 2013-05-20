class WinesController < ApplicationController
  def new
  	@wine = Wine.new
  end

  def destroy
    Wine.find(params[:id]).destroy
    flash[:success] = "Wine removed from database."
    redirect_to wines_url
  end

  def create
    @wine = Wine.new(params[:wine])
    if @wine.save
      flash[:success] = "Successfully added a wine!"
      redirect_to @wine
    else
      render 'new'
    end
  end

  def edit
    @wine = Wine.find(params[:id])
  end

  def update
    @wine = Wine.find(params[:id])
    if @wine.update_attributes(params[:wine])
      flash[:success] = "Wine profile updated"
      redirect_to @wine
    else
      render 'edit'
    end
  end

  def show
    @wine = Wine.find(params[:id])
  end

  def index
    @wines = Wine.paginate(page: params[:page])
  end
end
