class SessionsController < ApplicationController
  def index
  end

  def new
  end

  def create
    if @user = User.find_by(email: params[:user][:email]).try(:authenticate, params[:user][:password])
      session[:id]=@user.id
      redirect_to "/users/#{@user.id}"
    else
      flash[:loginErrors]='Login failed. Make sure your email and password are entered correctly. If you are not yet registered get started today'
      redirect_to '/sessions/new'
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
    session.clear
    redirect_to '/'
  end
end
