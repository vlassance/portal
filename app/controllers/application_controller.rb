class ApplicationController < ActionController::Base
  before_filter :authenticate_usuario!
  protect_from_forgery

  def redirect_success(message, controller, action)
  	redirect_to({:controller=> controller, :action => action}, :flash => { :notice_success => message })   
  end

  def redirect_success_show(message, controller, id)
    redirect_to({:controller=> controller, :action => :show, :id => id}, :flash => { :notice_success => message })   
  end

  def redirect_error(message, controller, action)
  	redirect_to({:controller=> controller, :action => action}, :flash => { :notice_error => message })   
  end

 def sendEmail (data, nome, descricao)
    DatasMailer.datas("raphael.sampaio@gmail.com",data, nome, descricao).deliver
 end

def render_404
  respond_to do |format|
    format.html { render :file => "#{Rails.root}/public/404.html", :status => :not_found }
    format.xml  { head :not_found }
    format.any  { head :not_found }
  end
end


end
