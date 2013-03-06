class CoordenadorEstagiosController < ApplicationController
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
  end

  # POST /coordenador_estagios
  # POST /coordenador_estagios.json
  def create
    @coordenador_estagio = CoordenadorEstagio.new(params[:coordenador_estagio])

    respond_to do |format|
      if @coordenador_estagio.save
        format.html { redirect_to @coordenador_estagio, notice: 'Coordenador estagio was successfully created.' }
        format.json { render json: @coordenador_estagio, status: :created, location: @coordenador_estagio }
      else
        format.html { render action: "new" }
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
        format.html { redirect_to @coordenador_estagio, notice: 'Coordenador estagio was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
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
end
