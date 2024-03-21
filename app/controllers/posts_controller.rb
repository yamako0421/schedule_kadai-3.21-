class PostsController < ApplicationController
  def index
    @posts = Post.all
    @total_count = Post.total_count
    @today = Date.today

  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params.require(:post).permit(:title, :start_date, :end_date, :is_all_day, :memo))
    if @post.save
      flash[:notice] = "予定を新規追加しました"
      redirect_to :posts
    else
      flash[:notice_no_create] = "予定の登録に失敗しました"
      render "new"   
  end
end

def show
  @post = Post.find(params[:id])
end

def edit
  @post = Post.find(params[:id])
end

def update
  @post = Post.find(params[:id])
  if @post.update(params.require(:post).permit(:title, :start_date, :end_date, :is_all_day, :memo))
    flash[:notice] = "スケジュールを更新しました"
    redirect_to :posts
  else
    flash[:notice_no_update] = "スケジュールを更新できませんでした"
    render "edit"
  end
end

def destroy  
  @post = Post.find(params[:id])
  @post.destroy
  flash[:notice] = "予定を削除しました"
  redirect_to :posts
  end
end

