class PostcodeController < ApplicationController
  def index
    @postcodes = Postcode.search(params[:search])
#  if params[:search]
#    @posts = Postcode.search(params[:search]).order("created_at DESC")
#  else
#    @posts = Postcode.all.order('created_at DESC')
#  end
  
  end
  
#  def search
#   @q = "%#{params[:query]}%"
#   @postcodes = Postcode.where("pstcode ILIKE ? or address ILIKE ? or city ILIKE ?", @q, @q, @q)
#   render 'index'
#   end 

 private
 
 def search_params
    params.require(:postcode).permit(:pstcode, :address, :city, :state, :country)
 end  

end
