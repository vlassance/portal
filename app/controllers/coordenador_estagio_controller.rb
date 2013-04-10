class CoordenadorEstagioController < ApplicationController

  before_filter :check_user
  # GET /coordenador_estagios
  # GET /coordenador_estagios.json
  def index
    @coordenador_estagios = CoordenadorEstagio.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @coordenador_estagios }
    end
  end

  # GET /coordenador_estagios/1
  # GET /coordenador_estagios/1.json
  def show
    @coordenador_estagio = CoordenadorEstagio.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @coordenador_estagio }
    end
  end

  # GET /coordenador_estagios/new
  # GET /coordenador_estagios/new.json
  def new
    @coordenador_estagio = CoordenadorEstagio.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @coordenador_estagio }
    end
  end

  # GET /coordenador_estagios/1/edit
  def edit
    @coordenador_estagio = CoordenadorEstagio.find(params[:id])
    @edit = true
  end

  # POST /coordenador_estagios
  # POST /coordenador_estagios.json
  def create
    @coordenador_estagio = CoordenadorEstagio.new(params[:coordenador_estagio])
    grupo_admin = Grupo.where(internal_id: Grupo::COORDERNADOR).first
    @coordenador_estagio.grupo = grupo_admin

    respond_to do |format|
      if @coordenador_estagio.save
        format.html { redirect_success("Coordenador adicionado com sucesso!",:coordenador_estagio, :index)}
        format.json { render json: @coordenador_estagio, status: :created, location: @coordenador_estagio }
      else
        puts "----------- #{@coordenador_estagio.errors.full_messages}"
        format.html { redirect_error("Erro ao adicionar coordenador!" + @coordenador_estagio.errors.to_s,:coordenador_estagio, :index)}
        format.json { render json: @coordenador_estagio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /coordenador_estagios/1
  # PUT /coordenador_estagios/1.json
  def update
    @coordenador_estagio = CoordenadorEstagio.find(params[:id])

    respond_to do |format|
      if @coordenador_estagio.update_attributes(params[:coordenador_estagio])
        format.html { redirect_success("Coordenador alterado com sucesso!",:coordenador_estagio, :index)}
        format.json { head :no_content }
      else
        format.html { redirect_error("Erro ao alterar coordenador!",:coordenador_estagio, :index)}
        format.json { render json: @coordenador_estagio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /coordenador_estagios/1
  # DELETE /coordenador_estagios/1.json
  def destroy
    @coordenador_estagio = CoordenadorEstagio.find(params[:id])
    @coordenador_estagio.destroy

    respond_to do |format|
      format.html { redirect_to coordenador_estagios_url }
      format.json { head :no_content }
    end
  end

  protected    
    def check_user
      if !current_usuario.isAdmin? && !current_usuario.isCoordenador?
        render_404
      end
    end
end
