class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.page(params[:page]).per(5)
    @relationship = current_user.relationships.find_by(followed_id: @user.id)
    @set_relationship = current_user.relationships.new
  end

  def hide
   @user =User.find(params[:id])
    #is_deletedカラムにフラグを立てる(defaultはfalse)
   @user.update(is_deleted: true )
   #ログアウトさせる
   reset_session
   flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
   NotificationMailer.send_confirm_to_user(@user).deliver
   redirect_to root_path
  end

  def withdraw
    @user = current_user
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
       @user = User.find(params[:id])
    if @user.update(user_params)
     redirect_to user_path(@user.id)
    else
     @users = User.find(params[:id])
     render:edit
    end
  end

  def followings
    @user = User.find(params[:id])
    @users = @user.followings.all.page(params[:page]).per(10)
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.followers.all.page(params[:page]).per(10)
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end

  private

  def user_params
    params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :introduction, :image)
  end

end
