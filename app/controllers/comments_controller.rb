class CommentsController < ApplicationController
  def index
  end

  def new
  end

  def create
    @comment = Comment.create(commentParams)
    if @comment.valid?
      redirect_to "/messages/#{@comment.message.id}"
    else
      flash[:commentErrors] = @comment.errors.full_messages
      redirect_to "/messages/#{@comment.message.id}"
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to "/messages/#{@comment.message.id}"
  end
  private
  def commentParams
    params.require(:comment).permit(:content,:user_id,:message_id)
  end
end
