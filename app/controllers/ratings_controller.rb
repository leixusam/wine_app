class RatingsController < ApplicationController
  def new
  	@rating = Rating.new
  end

  def create
  	@rating = Rating.new(params[:rating])
  	if @rating.save
  		flash[:success] = "Rating submitted!"
      redirect_to @rating
  	else
  		render 'new'
  	end
  end

  def show
  	@rating = Rating.find(params[:id])
  end
end
