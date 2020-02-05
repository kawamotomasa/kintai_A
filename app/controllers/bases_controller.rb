class BasesController < ApplicationController
before_action :admin_user, only: [:index, :new, :update,:create,:edit,:destroy]


  def index
   @bases = Bases.paginate(page: params[:page])
    if params[:office_name].present? 
    @bases = @bases.get_by_name params[:office_name]
    end
  end
 
  def new
  @bases = Bases.new
  end
  
  def update
   @bases = Bases.find(params[:id])
    if @bases.update_attributes(bases_params)
       flash[:success] = "拠点情報を更新しました。"
       redirect_to bases_path
    else
    render :edit
    end
  end
  
  def create
    @bases = Bases.new(bases_params)
     if @bases.save
       flash[:success] = '新規作成に成功しました。'
       redirect_to bases_path
     else
      render :new
     end
  end
    
  def edit
    @bases = Bases.find(params[:id])
  end
    
  def destroy
    Bases.find(params[:id]).destroy
    flash[:success] = "削除しました。"
    redirect_to bases_path
  end
  

private

   def bases_params
       params.require(:bases).permit(:office_no,:office_name,:work_kind)
   end

end

