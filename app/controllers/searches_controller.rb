class SearchesController < ApplicationController

# before_action :authenticate_user!

   def search
    @range = params[:range]
    @range = "Post"
    @posts = Post.looks(params[:search], params[:word]).page(params[:page]).per(5)
   end


end
