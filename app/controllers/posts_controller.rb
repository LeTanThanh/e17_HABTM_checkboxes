class PostsController < ApplicationController
  before_action :load_post, only: :show

  def new
    @post = Post.new
  end

  def create
    @post = Post.new post_params

    if @post.save
      redirect_to @post
    else
      render :new
    end
  end

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

  def post_params
    params.require(:post).permit :title, :body, tag_ids: []
  end
end
