module ApplicationHelper
 

  def layout_index (options)
    notice = ""
    flash.each do |name, msg|       
      if name.to_s == "notice_success"
        notice += "<div class='alert green fade in'>
            <button type='button' class='close' data-dismiss='alert'>x</button>
             <strong>Sucesso!</strong> 
             #{ msg }  
          </div> "
      else
        notice += "<div class='alert red fade in'>
            <button type='button' class='close' data-dismiss='alert'>x</button>
             <strong>Erro!</strong> 
             #{ msg }  
          </div> "
        end
    end
    canAdd = true
    link_new_tag = !canAdd ? nil : ( link_to options[:button_title].to_s, options[:button_path].to_s, :class => "btn light-blue inverse" )  
    html = <<-HTML
          <div class="container-fluid">
               #{ link_new_tag }
              <div class="row-fluid">
                <div class="span12">
                  <div class="box bordered" style="position:relative;">
                    <div class="box-header" >
                      <i class="icon-signal"></i> #{ options[:title].to_s }
                   </div>
                    #{ notice }
                    #{ render "table" }
                  </div>             
               </div>
            </div>
          </div>
    HTML
        html.html_safe
  end


  def layout_edit_and_new (options)
    options[:partial] = "form" if options[:partial].blank?
    html = <<-HTML
    
          <div class="container-fluid">
            <div class="row-fluid">
              <div class="span12">
                <div class="box bordered">
                  <div class="box-header">
                    <i class="icon-th-list"></i>#{ options[:title].to_s }
                    <div class="pull-right">
                      <div class="btn-group">
                        <a class="dropdown-toggle" data-toggle="dropdown">
                          <i class="icon-cog"></i>
                        </a>
                        <ul class="dropdown-menu dropdown-left">
                          <li><a href="#">Salvar</a></li>
                          <li><a href="#">Cancelar</a></li>
                        </ul>
                      </div>
                    </div>
                  </div>
                  <div class="row-fluid">
                    <div class="span12">
                      <div class="padded">
                        <div class="section-title">
                          #{ options[:subtitle].to_s }
                        </div>
                        #{ render options[:partial].to_s }
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
    HTML
        html.html_safe
  end
  
 def icons
    File.readlines('icons.txt')
  end

  def openwebicons
    File.readlines('openweb.txt')
  end

  def nav_active(options = {})
    cumbs = request.fullpath.to_s
    if options[:secondary] and cumbs.include? options[:secondary].to_s
      return "active" 
    elsif options[:primary] and cumbs.include? options[:primary].to_s
      return "active" 
    end
      return ""
  end

  def layout_show (options)
    html = <<-HTML
    
          <div class="container-fluid">
            <div class="row-fluid">
              <div class="span12">
                <div class="box bordered">
                  <div class="box-header">
                    <i class="icon-th-list"></i>#{ options[:title].to_s }
                    <div class="pull-right">
                      <div class="btn-group">
                        <a class="dropdown-toggle" data-toggle="dropdown">
                          <i class="icon-cog"></i>
                        </a>
                        <ul class="dropdown-menu dropdown-left">
                          <li><a href="#">Salvar</a></li>
                          <li><a href="#">Cancelar</a></li>
                        </ul>
                      </div>
                    </div>
                  </div>
                  <div class="row-fluid">
                    <div class="span6">
                        #{ render 'details' }
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
    HTML
        html.html_safe
  end
  



end
