class ApplicationController < ActionController::Base
  before_filter :authenticate_usuario!
  protect_from_forgery

  def redirect_success(message,controller, action)
  	redirect_to({:controller=> controller, :action => action}, :flash => { :notice_success => message })   
  end

  def redirect_error(message,controller, action)
  	redirect_to({:controller=> controller, :action => action}, :flash => { :notice_error => message })   
  end

   def sendEmail
      #email = @params["email"]
      email = Hash.new
	  email[:recipient] = "caiotuxo@gmail.com"
	  email[:subject] = "teste"
	  email[:message] = "que lixo de negocio"
	  recipient = email["recipient"]
	  subject = email["subject"]
	  message = email["message"]
      Emailer.deliver_contact(recipient, subject, message)
      return if request.xhr?
      render :text => 'Message sent successfully'
   end

end
