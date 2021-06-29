class SearchesController < ApplicationController

  def search
    @range = params[:range]
    @range = "Post"
    # rangeにユーザはあえて実装しない。投稿内容からユーザーと繋がるサイトコンセプトのため
    @posts = Post.looks(params[:search], params[:word]).page(params[:page]).per(5)
  end
end
