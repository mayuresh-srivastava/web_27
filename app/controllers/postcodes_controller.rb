class PostcodesController < ApplicationController
  
  def index
    @postcodes = Postcode.all
  end
  
  def show
    @postcode = Postcode.find(params[:id]) 
  end
  
  def new
    @postcode = Postcode.new
  end
  
  def edit   
     @postcode = Postcode.find(params[:id]) #rescue nil
  end  
  
  def create
    @postcode = Postcode.new(postcode_params)

    if @postcode.save
      #flash.now[:notice] = "You signed up successfully."
      #flash.now[:color]= "valid"
      redirect_to search_postcodes_path
    else
      #flash.now[:notice] = "Something wrongly filled." 
      #flash.now[:color]= "invalid"
      render "new"
    end
  end
  
  def pstsearch
      
         @postcodes = Postcode.search(params[:pattern])
#  if params[:search]
#    @posts = Postcode.search(params[:search]).order("created_at DESC")
#  else
#    @posts = Postcode.all.order('created_at DESC')
#  end
  
  end
  
  def update
  @postcode = Postcode.find(params[:id])
 
  if @postcode.update(postcode_params)
    redirect_to search_postcodes_path
  else
    render 'edit'
  end
  end
  
  def destroy
    
    @postcode = Postcode.find(params[:id])
    @postcode.destroy
    redirect_to search_postcodes_path
  
  end
  
  
  
  
#  def search
#   @q = "%#{params[:query]}%"
#   @postcodes = Postcode.where("pstcode ILIKE ? or address ILIKE ? or city ILIKE ?", @q, @q, @q)
#   render 'index'
#   end 

 private
 
 def postcode_params
    params.require(:postcode).permit(:pstcode, :address, :city, :state, :country)
 end  

end
