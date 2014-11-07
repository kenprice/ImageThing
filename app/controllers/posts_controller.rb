class PostsController < ApplicationController
  before_action :logged_in_user, only: [:new, :update]

  def index  
    @post = Post.all
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      # Handle a successful update  
      flash[:success] = "Success!"
      redirect_to @post
    else
      render 'edit'
    end
  end

	def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "Post success!"
      redirect_to @post
    else
      flash[:error] = "Invalid"
      render 'new'
    end
	end
  
  def show
    @post = Post.find(params[:id])
    #debugger
  end

	private

  	# Use strong_parameters for attribute whitelisting
  	# Be sure to update your create() and update() controller methods.
  	def post_params
  	  params.require(:post).permit(:title, :caption, :photo)
  	end

    def logged_in_user
      unless logged_in?
        #makes sure only logged-in users can access certain pages
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
end
