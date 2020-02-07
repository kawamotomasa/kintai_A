class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :edit_basic_info]
  #before_action :logged_in_user, only: [:index, :edit, :update, :destroy, :edit_basic_info, :update_basic_info]
  before_action :correct_user, only: [:show]
  before_action :admin_user, only: [:index,:edit,:destroy,:edit_basic_info, :update_basic_info,:working]
  #before_action :admin_or_correct_user, only: [:index,:show,:edit,:update]
  before_action :set_one_month, only: :show

  def index
    @users = User.paginate(page: params[:page])
    if params[:name].present? 
    @users = @users.get_by_name params[:name]
    end
  end

  def show
    @worked_sum = @attendances.where.not(started_at: nil).count
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = '新規作成に成功しました。'
      redirect_to @user
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "ユーザー情報を更新しました。"
      redirect_to users_url
    else
      render :edit      
    end
  end
  
  def import
    
  if params[:csv_file].blank?
     redirect_to(users_url, alert: 'インポートするCSVファイルを選択してください')
  else
    num = Admin::User.import(params[:csv_file])
    redirect_to(users_url, notice: "#{num.to_s}件のユーザー情報を追加 / 更新しました")
  end
  end
 
  def working
  @user = User.joins(:attendances).where.not(attendances: {started_at: nil}).where(attendances: {finished_at: nil})
  end

  def destroy
    @user.destroy
    flash[:success] = "#{@user.name}のデータを削除しました。"
    redirect_to users_url
  end

  def edit_basic_info
  end

  def update_basic_info
    if @user.update_attributes(basic_info_params)
      flash[:success] = "#{@user.name}の基本情報を更新しました。"
    else
      flash[:danger] = "#{@user.name}の更新は失敗しました。<br>" + @user.errors.full_messages.join("<br>")
    end
    redirect_to users_url
  end

  def edit_overwork_request
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
    
    @day=Date.parse(params[:day])
    @youbi = params[:youbi]
    @dates = user_attendances_month_date
    
  end

 def update_overwork_request
    @user = Attendance.find(params[:id])
    
    if @user.update_attributes(overwork_request_params)
       flash[:success] = "残業申請しました"
    else
       flash[:danger] = "#更新は失敗しました。" + @user.errors.full_messages.join("、")
    end
       redirect_to users_url  
 end

  
  private

    def user_params
      params.require(:user).permit(:name, :email, :department, :password,:employee_number,:uid, :basic_time, :designated_work_start_time, :designated_work_end_time)
    end

    def basic_info_params
      params.require(:user).permit(:department, :basic_time, :work_time)
    end
    
    def overwork_request_params
      params.require(:attendance).permit(:work_process,:finished_overwork_at)
    end
    
    def admin_or_correct_user
      unless current_user?(@user) || current_user.admin?
        flash[:danger] = "権限がありません。"
        redirect_to(root_url)
      end  
    end
end