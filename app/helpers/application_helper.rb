module ApplicationHelper
 
def br_states
  [
   ['São Paulo', 'SP'],
    ['Acre', 'AC'],
    ['Alagoas', 'AL'],
    ['Amapá', 'AP'],
    ['Amazonas', 'AM'],
    ['Bahia', 'BA'],
    ['Ceará', 'CE'],
    ['Distrito Federal', 'DF'],
    ['Espírito Santo', 'ES'],
    ['Goiás', 'GO'],
    ['Maranhão', 'MA'],
    ['Mato Grosso', 'MT'],
    ['Mato Grosso do Sul', 'MS'],
    ['Minas Gerais', 'MG'],
    ['Pará', 'PA'],
    ['Paraába', 'PB'],
    ['Paraná', 'PR'],
    ['Pernambuco', 'PE'],
    ['Piauí', 'PI'],
    ['Rio de Janeiro', 'RJ'],
    ['Rio Grande do Norte', 'RN'],
    ['Rio Grande do Sul', 'RS'],
    ['Rondônia', 'RO'],
    ['Roraima', 'RR'],
    ['Santa Catarina', 'SC'],
    ['Sergipe', 'SE'],
    ['Tocantins', 'TO']
  ]
  end
  
   def sexos
    [
      ['Masculino','Masculino'],
      ['Feminino','Feminino']
    ]
   end

   
  def layout_index (options)
    notice = ""
    flash.each do |name, msg|       
      if name.to_s == "notice_success" and msg.length > 0
        notice += "<div class='alert green fade in'>
            <button type='button' class='close' data-dismiss='alert'>x</button>
             <strong>Sucesso!</strong> 
             #{ msg }  
          </div> "
      elsif msg.length > 0
        notice += "<div class='alert red fade in'>
            <button type='button' class='close' data-dismiss='alert'>x</button>
             <strong>Erro!</strong> 
             #{ msg }  
          </div> "
        end
    end
    canAdd = options[:can_create]
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

  def notice_helper
    notice = ""
    flash.each do |name, msg|       
      if name.to_s == "notice_success" and msg.length > 0
        notice += "<div class='alert green fade in'>
            <button type='button' class='close' data-dismiss='alert'>x</button>
             <strong>Sucesso!</strong> 
             #{ msg }  
          </div> "
      elsif msg.length > 0
        notice += "<div class='alert red fade in'>
            <button type='button' class='close' data-dismiss='alert'>x</button>
             <strong>Erro!</strong> 
             #{ msg }  
          </div> "
        end
    end

     html = <<-HTML
              #{ notice }
               HTML
            html.html_safe
  end  

  def layout_show (options)

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
                        </ul>
                      </div>
                    </div>
                  </div>
                  <div class="row-fluid">
                    <div class="span6">
                        #{ notice }
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
