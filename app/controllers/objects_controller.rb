 class Objectscontroller < ApplicationController
  def import
   if params[:csv_file].blank?
     redirect_to(users_url, alert: 'インポートするCSVファイルを選択してください')
   else
    num = Admin::User.import(params[:csv_file])
    redirect_to(users_url, notice: "#{num.to_s}件のユーザー情報を追加 / 更新しました")
   end
    
  end
 end