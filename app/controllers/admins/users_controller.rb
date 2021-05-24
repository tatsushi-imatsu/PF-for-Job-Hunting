class Admins::UsersController < ApplicationController

  before_action :authenticate_admin!

  def index
    @users = User.all.page(params[:page]).per(10)
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.page(params[:page]).per(5)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save
    redirect_to admins_user_path(@user)
    else
    @user = User.find(params[:id])
    render :edit
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to admins_users_path
  end

  def user_params
    params.require(:user).permit(:is_deleted)
  end

end
