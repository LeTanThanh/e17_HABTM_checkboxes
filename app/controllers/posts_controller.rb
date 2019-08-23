class PostsController < ApplicationController
  def index
    @posts = Post.all.includes(:tags).page(params[:page]).per 10
  end
end
