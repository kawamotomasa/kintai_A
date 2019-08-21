  def import
    Objects.import(params[:file])
    redirect_to "/object"
  end