class AddressesController < ApplicationController
before_action :find_address, only: %i[show edit update destroy]

def new
  @address = current_user.addresses.build
end

def create
  @address = current_user.addresses.build(address_params)
  @address.save ? (redirect_to user_path(@address.user.id)) : (render :new)
end

def show
end

private

def find_address
  @address = Address.find_by(id: params[:id])
end

def address_params
  params.require(:address).permit(:add_l1, :city, :state, :zip, :user_id, :propertyname, :add_l2)
end

end
