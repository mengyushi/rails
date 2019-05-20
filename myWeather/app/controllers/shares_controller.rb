class SharesController < ApplicationController
  def new
  end
  
  
  def create
    @share = Share.new(params[:share])
   
    @share.save
    redirect_to @share
  end
  
private
  def share_params
    params.require(:share).permit(:title, :url)
  end  
  
end
