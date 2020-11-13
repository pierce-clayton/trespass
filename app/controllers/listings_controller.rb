class ListingsController < ApplicationController
  before_action :find_address
  before_action :find_listing, only: %i[show edit update destroy]
  
  def new
    @user = User.find_by(id: params[:user_id])
    @address = Address.find_by(id: params[:address_id])
    @listing = @address.listings.build
  end

  def create
    @listing = @address.listings.build(listing_params)
    @listing.save ? (redirect_to listing_path(@listing.id)) : (render :new)
  end

  def index
    @listings = Listing.all
  end

  def show
  end

  private
  
  def find_address
    if params[:listing]
      @address = Address.find_by(id: params[:listing][:address_id])
    else
      @address = Address.find_by(id: params[:id])
    end
  end
  
  def find_listing
    @listing = Listing.find(params[:id])
  end

  def listing_params
    params.require(:listing).permit(:price, :avail_start, :avail_end, :description, :allowed_activities, :address_id)
  end

end
