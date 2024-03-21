class UsersController < ApplicationController

  def index
    @users = User.all
    @total_count = User.total_count
    @today = Date.today

  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(:title, :start_date, :end_date, :is_all_day, :memo))
    if @user.save
      flash[:notice] = "予定を新規追加しました"
      redirect_to :users
    else
      flash[:notice_no_create] = "予定の登録に失敗しました"
      render "new"   
  end
end

def show
  @user = User.find(params[:id])
end

def edit
  @user = User.find(params[:id])
end

def update
  @user = User.find(params[:id])
  if @user.update(params.require(:user).permit(:title, :start_date, :end_date, :is_all_day, :memo))
    flash[:notice] = "スケジュールを更新しました"
    redirect_to :users
  else
    flash[:notice_no_update] = "スケジュールを更新できませんでした"
    render "edit"
  end
end

def destroy  
  @user = User.find(params[:id])
  @user.destroy
  flash[:notice] = "予定を削除しました"
  redirect_to :users
  end
end

