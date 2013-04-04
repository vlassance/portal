class ModulosController < ApplicationController

  before_filter :check_user, :except => [:show]

  def index
    @modulos = Modulo.where(:ano.gte => Date.today.year)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @modulos }
    end
  end

  # GET /modulos/1
  # GET /modulos/1.json
  def show
    @modulo = Modulo.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @modulo }
    end
  end

  # GET /modulos/new
  # GET /modulos/new.json
  def new
    @modulo = Modulo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @modulo }
    end
  end

  # GET /modulos/1/edit
  def edit
    @modulo = Modulo.find(params[:id])
  end

  # POST /modulos
  # POST /modulos.json
  def create
    @modulo = Modulo.new(params[:modulo])

    respond_to do |format|
      if @modulo.save
        format.html { redirect_success("Módulo adicionado com sucesso!",:modulos, :index)}
        format.json { render json: @modulo, status: :created, location: @modulo }
      else
        format.html { redirect_error("Não foi possível criar o módulo!",:modulos, :index)}
        format.json { render json: @modulo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /modulos/1
  # PUT /modulos/1.json
  def update
    @modulo = Modulo.find(params[:id])

    respond_to do |format|
      if @modulo.update_attributes(params[:modulo])
        format.html { redirect_success("Módulo alterado com sucesso!",:modulos, :index)}
        format.json { head :no_content }
      else
        format.html { redirect_error("Não foi possível criar o módulo!",:modulos, :index)}
        format.json { render json: @modulo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /modulos/1
  # DELETE /modulos/1.json
  def destroy
    @modulo = Modulo.find(params[:id])
    @modulo.destroy

    respond_to do |format|
        format.html { redirect_success("Módulo removido com sucesso!",:modulos, :index)}
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
