class PostcodesController < ApplicationController
#  skip_before_filter :verify_authenticity_token
  respond_to :html
  respond_to :js
  require 'json'
  
  def index
    
  client = Contentful::Client.new(
  access_token: '4a08907fda227704d43a516981fe057f7fdbe90ecf094b58118003ece3c84fbe',
  space: 'i3qt1vuoqo6u',
  dynamic_entries: :auto
  )
  
  content_type = client.entries(content_type: 'web27')
  
  jsonstring = content_type.to_json
  
  @jsonobj=JSON.parse(jsonstring)
  @length=@jsonobj.length
  @result =@jsonobj[0]["fields"]["en-US"]["allTxt"]
  
  @len = @jsonobj[0]["fields"]["en-US"]["allImg"].length
  #  @url = @jsonobj[0]["fields"]["en-US"]["allImg"][i]["fields"]["en-US"]["file"]["properties"]["url"]
  @url = @jsonobj[0]["fields"]["en-US"]["allImg"]

  @postcodes = Postcode.all
  
  @postcodes = Postcode.search(params[:pattern])
     
  #@postcode = Postcode.new
  
  end
  
  def show
    #@postcode = Postcode.find(params[:id]) 
  end
  
  def new
    respond_to do |format|
    @postcode = Postcode.new
    format.js
   end
  end
  
  def edit
    respond_to do |format|
     @postcode = Postcode.find(params[:id]) #rescue nil
    format.js
    end
  end  
  
  def create
    
    respond_to do |format|
    @postcode = Postcode.new(postcode_params)

    if @postcode.save
      #flash.now[:notice] = "You signed up successfully."
      #flash.now[:color]= "valid"
      format.html {redirect_to @postcode}
      format.js 
    else
      #flash.now[:notice] = "Something wrongly filled." 
      #flash.now[:color]= "invalid"
      format.html {render :new}
      format.js 
    end
    end
  end
  
# def pstsearch
    
    #    @postcodes = Postcode.search(params[:pattern])
         
     #    @postcode = Postcode.new
        
=begin
  if params[:search]
   @posts = Postcode.search(params[:search]).order("created_at DESC")
  else
    @posts = Postcode.all.order('created_at DESC')
  end
=end
  
# end
  
  def update
    
  respond_to do |format|
  @postcode = Postcode.find(params[:id])
 
  if @postcode.update(postcode_params)
    format.html {redirect_to @postcode}
    format.js #{ render layout: false, content_type: 'text/javascript' }
  else
    format.html {render :edit}
    format.js #{ render layout: false, content_type: 'text/javascript' }
  end
  end
  
  
  end
  
  def destroy
    
    respond_to do |format|
    @postcode = Postcode.find(params[:id])
    @postcode.destroy
    format.html {redirect_to postcodes_path}
    format.js
    end
  
  end
  

 private
 
 def postcode_params
    params.require(:postcode).permit(:pstcode, :address, :city, :state, :country)
 end  

end
