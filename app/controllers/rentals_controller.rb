class RentalsController < ApplicationController
  def new
    @listing = Listing.find_by(id: params[:listing_id])
    @user = User.find_by(id: params[:user_id]) #host user
    @rental = current_user.rentals.build
  end
  
  def create
    @listing = Listing.find_by(id: params[:rental][:listing_id])
    @user = User.find_by(id: params[:rental][:user_id]) #host user
    @rental = current_user.rentals.build(rental_params)
    # byebug
    @rental.save ? (redirect_to rental_path(@rental.id)) : (render :new)
  end

  def show
    @rental = Rental.find_by(id: params[:id])
  end

  private

  def rental_params
    params.require(:rental).permit(:start_date, :end_date, :souls, :vehicles, :user_id, :listing_id)
  end
  
end
