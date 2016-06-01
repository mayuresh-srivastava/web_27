class PostcodesController < ApplicationController
#  skip_before_filter :verify_authenticity_token
  #respond_to :js

  
  def index
    #@postcodes = Postcode.all
    
    @postcodes = Postcode.search(params[:pattern])
       
    @postcode = Postcode.new
    
  end
  
  def show
    #@postcode = Postcode.find(params[:id]) 
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
      format.html {redirect_to postcodes_path}
      format.js
    else
      #flash.now[:notice] = "Something wrongly filled." 
      #flash.now[:color]= "invalid"
      format.html {render :new}
      format.js
    end
  end
  
#  def pstsearch
    
      
#         @postcodes = Postcode.search(params[:pattern])
         
#         @postcode = Postcode.new

=begin
  if params[:search]
   @posts = Postcode.search(params[:search]).order("created_at DESC")
  else
    @posts = Postcode.all.order('created_at DESC')
  end
=end
  
#  end
  
  def update
    
    respond_to do |format|
  @postcode = Postcode.find(params[:id])
 
  if @postcode.update(postcode_params)
    format.html {redirect_to postcodes_path}
    format.js #{ render layout: false, content_type: 'text/javascript' }
  else
    format.html {render :edit}
    format.js #{ render layout: false, content_type: 'text/javascript' }
  end
  end
  
  
  end
  
  def destroy
    
    @postcode = Postcode.find(params[:id])
    @postcode.destroy
    format.html {redirect_to postcodes_path}
    format.js
  
  end
  

 private
 
 def postcode_params
    params.require(:postcode).permit(:pstcode, :address, :city, :state, :country)
 end  

end
