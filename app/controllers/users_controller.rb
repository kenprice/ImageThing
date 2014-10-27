class UsersController < ApplicationController
  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    #debugger
  end

  # GET /users/new
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      flash[:error] = "Invalid"
      render 'new'
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
end
