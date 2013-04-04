class EventosController < ApplicationController

  before_filter :check_user, :except => [:index, :show] 
  # GET /eventos
  # GET /eventos.json
  def index
    @eventos = Evento.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @eventos }
    end
  end

  # GET /eventos/1
  # GET /eventos/1.json
  def show
    @evento = Evento.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @evento }
    end
  end

  # GET /eventos/new
  # GET /eventos/new.json
  def new
    @evento = Evento.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @evento }
    end
  end

  # GET /eventos/1/edit
  def edit
    @evento = Evento.find(params[:id])
  end

  # POST /eventos
  # POST /eventos.json
  def create
    a = Date.strptime(params[:evento][:dataInicio], '%d/%m/%Y')
    b = Date.strptime(params[:evento][:dataFim], '%d/%m/%Y')
    params[:evento][:dataInicio] = a
    params[:evento][:dataFim] = b
    @evento = Evento.new(params[:evento])

    if current_usuario.isAdminEmpresa?
      @evento.admin_empresa = current_usuario
    end
    if current_usuario.isAdmin?
      @evento.admin_instituicao = current_usuario
    end

    respond_to do |format|
      if @evento.save
       t1 = Thread.new {sendEmail params[:evento][:dataInicio].to_s, params[:evento][:nome].to_s , params[:evento][:descricao].to_s}
       #t1.join
        format.html { redirect_success("Evento adicionado com sucesso!",:eventos, :index)}
        format.json { render json: @evento, status: :created, location: @evento }
      else
        format.html { render action: "new" }
        format.json { render json: @evento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /eventos/1
  # PUT /eventos/1.json
  def update
    @evento = Evento.find(params[:id])

    respond_to do |format|
      if @evento.update_attributes(params[:evento])
        format.html { redirect_success("Evento alterado com sucesso!",:eventos, :index)}
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @evento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /eventos/1
  # DELETE /eventos/1.json
  def destroy
    @evento = Evento.find(params[:id])
    @evento.destroy

    respond_to do |format|
        format.html { redirect_success("Evento removido com sucesso!",:eventos, :index)}
      format.json { head :no_content }
    end
  end
  protected    
    def check_user
      if !current_usuario.isAdmin? && !current_usuario.isCoordenador? && !current_usuario.isAdminEmpresa?
        render_404
      end
    end
end
