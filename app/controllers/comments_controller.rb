class CommentsController < ApplicationController
  before_action :find_comment, only: %i[edit update show destroy]
  before_action :find_listing, only: %i[new create edit update destroy]
  def new
    @comment = Comment.new
    @comment[:listing_id] = @listing.id
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.save ? (redirect_to comment_path(@comment.id)) : (render :new)
  end

  def show
    
  end

  def edit

  end
  
  def destroy
    @comment.destroy ? (redirect_to listings_path) : (render :edit)
  end
  def index
    @comments = Comment.where(['listing_id = ?', params[:listing_id]])
  end

  def update
    @comment.update(update_params) ? (redirect_to listing_path(@comment.listing.id)) : (render :edit)
  end

  private

  def find_listing
    @listing = Listing.find_by(id: params[:listing_id])
  end

  def find_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:description, :listing_id, :user_id)
  end

  def update_params
    params.require(:comment).permit(:description, :user_id)
  end
end
