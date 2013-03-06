class ApplicationController < ActionController::Base
  protect_from_forgery

  def redirect_success(message,controller, action)
  	redirect_to({:controller=> controller, :action => action}, :flash => { :notice_success => message })   
  end

  def redirect_error(message,controller, action)
  	redirect_to({:controller=> controller, :action => action}, :flash => { :notice_error => message })   
  end

end
