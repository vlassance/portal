class GestorController < ApplicationController
  # GET /gestor
  # GET /gestor.json
  def index
    @gestor = Gestor.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @gestor }
    end
  end

  # GET /gestor/1
  # GET /gestor/1.json
  def show
    @gestor = Gestor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @gestor }
    end
  end

  # GET /gestor/new
  # GET /gestor/new.json
  def new
    @gestor = Gestor.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @gestor }
    end
  end

  # GET /gestor/1/edit
  def edit
    @gestor = Gestor.find(params[:id])
  end

  # POST /gestor
  # POST /gestor.json
  def create
    @gestor = Gestor.new(params[:gestor])
    @gestor.password = "12345678"
    @gestor.password_confirmation = "12345678"
    grupo_gestor = Grupo.where(internal_id: Grupo::GESTOR).first
    @gestor.grupo = grupo_gestor

    respond_to do |format|
      if @gestor.save
        format.html { redirect_success("Gestor adicionado com sucesso!",:gestor, :index)}
        format.json { render json: @gestor, status: :created, location: @gestor }
      else
        format.html { redirect_error("Erro ao adicionar o gestor!",:gestor, :index)}
        format.json { render json: @gestor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /gestor/1
  # PUT /gestor/1.json
  def update
    @gestor = Gestor.find(params[:id])

    respond_to do |format|
      if @gestor.update_attributes(params[:gestor])
        format.html { redirect_success("Gestor alterado com sucesso!",:gestor, :index)}
        format.json { render json: @gestor, status: :created, location: @gestor }
      else
        format.html { redirect_error("Erro ao atualizar o gestor!",:gestor, :index)}
        format.json { render json: @gestor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gestor/1
  # DELETE /gestor/1.json
  def destroy
    @gestor = Gestor.find(params[:id])
    @gestor.destroy

    respond_to do |format|
      format.html { redirect_to gestor_index_url }
      format.json { head :no_content }
    end
  end
end
