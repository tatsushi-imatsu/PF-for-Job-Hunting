class PostsController < ApplicationController
  # before_action :authenticate_user!
  def index
    @posts = Post.all.page(params[:page]).per(5)
    @post = current_user
    @all_ranks = Post.find(Favorite.group(:post_id).order(Arel.sql('count(post_id) desc')).limit(3).pluck(:post_id))
    @my_ranks = @all_ranks.select { |post| post.user_id == current_user.id }.take(3)
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      redirect_to posts_path
    else
      redirect_to posts_path
    end
  end

  def edit
    @post = Post.find(params[:id])
    if @post.user == current_user
      render :edit
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
