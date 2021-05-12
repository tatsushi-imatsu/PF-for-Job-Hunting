class SearchesController < ApplicationController

# before_action :authenticate_user!

   def search
    @range = params[:range]
    @range = "Post"
    @posts = Post.looks(params[:search], params[:word])
   end

end
