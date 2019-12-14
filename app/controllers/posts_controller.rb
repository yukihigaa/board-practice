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
    render('posts/create')
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    redirect_to('/posts/index')
  end
end
