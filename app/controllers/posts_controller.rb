class PostsController < ApplicationController
 before_action :authenticate_user!
  def index
    @posts = Post.all
    @post = current_user
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      redirect_to posts_path, notice: "You have created book successfully."
    else
      @user = current_user
      @posts = Post.all
      render :index
    end
  end

  def edit
    @post = Post.find(params[:id])
    if @post.user == current_user
      render:edit
    else
      redirect_to post_path(@post)
    end
  end



  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post), notice: "You have updated book successfully."
    else
      render "edit"
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to user_path(current_user)
  end


  private

  def post_params
    params.require(:post).permit(:name, :body, :user_id)
  end

end
