module ApplicationHelper
 

  def layout_index (options)
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
                    #{ render "table" }
                  </div>             
               </div>
            </div>
          </div>
    HTML
        html.html_safe
  end


  def layout_edit_and_new (options)
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
                        #{ render 'form' }
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
    a = request.path
    current_route = request.path.split("/")
    @primary = nil
    @secondary = nil
    if  current_route.count > 0
    	@primary = current_route.first.split(".").first # dashboard
    	@secondary = current_route.last.split(".").first
	end
    if options[:primary]
      return "active" if options[:primary] == @primary
    end

    if  options[:secondary]
      return "active" if options[:secondary] == @secondary
    end
  end
end
