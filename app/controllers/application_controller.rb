class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  #config.web_console.whitelisted_ips = '199.19.25.117'
#  layout false
#  layout 'application', :except => :view
  
end 


