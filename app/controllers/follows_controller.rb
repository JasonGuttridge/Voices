class FollowsController < ApplicationController
  before_action :requireLogin
  def index
  end

  def new
  end

  def create
    Follow.create(followParams)
    redirect_to "/users/#{currentUser.id}"
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
    @follow = Follow.find_by(user_id: params[:user_id], message_id: params[:message_id])
    @follow.destroy
    redirect_to "/users/#{currentUser.id}"
  end
  private
  def followParams
    params.require(:follow).permit(:user_id, :message_id)
  end
end
