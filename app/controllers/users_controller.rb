class UsersController < ApplicationController
  def index
  end

  def new
  end

  def create
    @user = User.create(userParams)
    if @user.valid?
      session[:id]=@user.id
      flash[:success] = "You have successfully registered. Login whenever you're ready"
      redirect_to '/sessions/new'
    else
      flash[:registerErrors] = @user.errors.full_messages
      redirect_to '/users/new'
    end
  end

  def show
    @myMessages = Message.where(user_id: currentUser.id)
    @userMessages = Follow.where(user_id: currentUser.id)
  end

  def edit
  end

  def update
    User.update(currentUser.id,userParams)
    redirect_to "/users/#{currentUser.id}"
  end

  def destroy
  end
  private
  def requireUser
    if params[:id] != currentUser.id.to_s
      redirect_to "/users/#{currentUser.id}"
    end
  end
  def userParams
    params.require(:user).permit(:firstName, :lastName, :email, :password, :password_confirmation)
  end
end
