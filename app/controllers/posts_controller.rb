class PostsController < ApplicationController
  
  def create
    @post = Post.new
  end

  def save
    @post = Post.new(content: params[:content])
    @post.save
    redirect_to('/posts/index')
  end

  def index
    @posts = Post.all
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def edit_save
    @post = Post.find_by(id: params[:id])
    @post.content = params[:content]
    @post.save
    redirect_to('/posts/index')
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    redirect_to('/posts/index')
  end
end
