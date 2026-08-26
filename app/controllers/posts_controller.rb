class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @posts = Post.limit(10).order(created_at: :desc)
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  def new
    @post = Post.new # 新規投稿用のインスタンス変数を用意
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    if @post.save
      flash[:notice] = t('.success')
      redirect_to posts_path # トップページから投稿一覧ページへ変更
    else
      flash[:alert] = t('.failure')
      render :new
    end
  end

  def destroy
    post = Post.find_by(id: params[:id])
    if post.user == current_user
      post.destroy
      flash[:notice] = t('.success')
    end
    redirect_to posts_path
  end

  private

  # ストロングパラメータで許可するカラムを指定
  def post_params
    params.expect(post: [:title, :content]) # title と content のみ許可
  end
end
