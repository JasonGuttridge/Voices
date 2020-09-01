class FollowsController < ApplicationController
  def index
  end

  def new
  end

  def create
    Follow.create(followParams)
    redirect_to '/messages'
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
  private
  def followParams
    params.require(:follow).permit(:user_id, :message_id)
  end
end
