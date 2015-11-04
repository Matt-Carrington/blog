class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user.id)
    else
      flash[:notice] = "Could not create new user"
      redirect_to signup_path
    end
  end

  def show
    @user = @current_user
  end

  def edit
  end

  def update
  end

  def login
  end

  def logout
    session[:user_id] = nil
    redirect_to root_path
  end

  def authenticate
    user = User.find_by email: params[:email]
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_path(user.id)
    else
      flash[:notice] = "Incorrect username or password"
      redirect_to login_path
    end
  end

  private
    def user_params
      params.require('user').permit(:email, :password, :password_confirmation)
    end
    
end
