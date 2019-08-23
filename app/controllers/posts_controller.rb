class PostsController < ApplicationController
  before_action :load_post, only: :show

  def index
    @posts = Post.all.includes(:tags).page(params[:page]).per 10
  end

  def show
  end

  private

  def load_post
    @post = Post.find_by id: params[:id]

    redirect_to root_path unless @post
  end
end
