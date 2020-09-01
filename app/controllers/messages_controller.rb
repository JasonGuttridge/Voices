class MessagesController < ApplicationController
  def index
    @messages = Message.where.not(user_id: currentUser.id)
    @userMessages = Message.where(user_id: currentUser.id)
    @follows = Follow.where(user_id: currentUser.id)
  end

  def new
  end

  def create
    @message = Message.create(messageParams)
    if @message.valid?
      redirect_to "/messages"
    else
      flash[:messageErrors] = @message.errors.full_messages
      redirect_to "/users/#{currentUser.id}"
    end
  end

  def show
    @message = Message.find(params[:id])
    @comments = Comment.where(message_id: params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    redirect_to "/users/#{currentUser.id}"
  end
  private
  def messageParams
    params.require(:message).permit(:content,:user_id)
  end
end
