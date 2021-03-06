class UsersController < ApplicationController
  #Before filter
  before_action :logged_in_user, only: [:edit, :update, :index, :front]
  before_action :correct_user, only: [:edit, :update, :front]
  
  def index  
    @user = User.all
  end
  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.page(params[:page])
    @allposts = @user.posts
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      # Handle a successful update  
      flash[:success] = "Success!"
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  def new
    @user = User.new
  end
  
  # POST /users/1
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to ImageSpace!"
      redirect_to @user
    else
      flash[:error] = "Invalid"
      render 'new'
    end
  end

  #GET /users/front
  def front
    #User's personal front page. Only user can access. Shows all
    #user photos and allows him to edit.
    @user = User.find(params[:id])
    @posts = @user.posts.page(params[:page])
    @allposts = @user.posts
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation, :avatar, :profile_bio)
    end

    def logged_in_user
      unless logged_in?
        #makes sure only logged-in users can access certain pages
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
    
    def correct_user
      #makes sure only correct users can access certain pages
      @user = User.find(params[:id])
      redirect_to root_url unless @user == current_user
    end
end
