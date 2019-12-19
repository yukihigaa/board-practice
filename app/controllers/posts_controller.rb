class PostsController < ApplicationController
  
  def create
    @post = Post.new
  end

  def save
    #usersテーブルとpostsテーブルを紐付けたら、user_idを@current_user.id でもってこれるようにする＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝
    #今は一旦１9で！
    @post = Post.new(content: params[:content], user_id: 19)
    if @post.save
      flash[:notice] = '投稿内容を保存しました'
      redirect_to('/posts/index')
    else
      flash[:notice] = @post.errors.full_messages
      redirect_to('/posts/create')
    end
  end

  def index
    @posts = Post.all.order(updated_at: :desc)
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def edit_save
    #usersテーブルとpostsテーブルを紐付けたら、user_idを@current_user.id でもってこれるようにする＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝
    #今は一旦１9で！
    @post = Post.find_by(id: params[:id])
    @post.content = params[:content]
    @post.user_id = 19
    @post.save
    if @post.save
      flash[:notice] = '投稿内容を更新しました'
      redirect_to('/posts/index')
    else
      flash[:notice] = @post.errors.full_messages
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    if @post.destroy
      flash[:notice] = '投稿を削除しました'
      redirect_to('/posts/index')
    else
      flash[:notice] = @post.errors.full_messages
    end
  end
end
