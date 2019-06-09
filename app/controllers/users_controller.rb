class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end
  
  def  create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = '新規作成に成功しました。'
      redirect_to @user
      #保存
    else
      flash.now[:danger] = '認証に失敗しました。'
      render :new
    end
  end
  
  def destroy
    log_out
    flash[:success] = 'ログアウトしました。'
    redirect_to root_path
  end
end
  
  private
  
  def user_params
  params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

