class PostsController < ApplicationController
  # before_action :find_post

  def index
    @posts = Post.all.order("created_at DESC")
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def show
    @post = Post.where(params[:id]).first
  end

  def edit
    @post = Post.where(params[:id]).first
  end

  def update
    @post = Post.where(params[:id]).first
    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.where(params[:id]).first
    @post.destroy
    redirect_to posts_path

  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :image)
  end

  def find_post
    @post = Post.find(params[:id])
  end

end