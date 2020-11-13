class UsersController < ApplicationController
  before_action :find_user, only: %i[edit update show destroy]
  before_action :if_not_logged_in, only: %i[show edit update destroy]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to listings_path
    else
      render :new
    end
  end

  def show
    
  end
  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

  def find_user
    @user = User.find_by(id: params[:id])
  end
end
