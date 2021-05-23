class Admins::PostsController < ApplicationController

  before_action :authenticate_admin!

  def index
    @posts = Post.all.page(params[:page]).per(10)
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to admins_posts_path
  end

end
