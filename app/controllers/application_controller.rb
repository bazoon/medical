class ApplicationController < ActionController::Base
  protect_from_forgery

def redirect_back_or(path,notice)
 redirect_to :back,:notice => notice
 rescue ActionController::RedirectBackError
 redirect_to path,:notice => notice
end

private

  def current_client
    @current_client ||= Client.find(session[:client_id]) if session[:client_id]  
  end  
 


 helper_method :current_client
  
end
