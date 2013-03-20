class AdminInstituicaosController < ApplicationController
 
  # GET /admin_instituicaos/1
  # GET /admin_instituicaos/1.json
  def show
    @admin_instituicao = AdminInstituicao.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @admin_instituicao }
    end
  end

  # GET /admin_instituicaos/new
  # GET /admin_instituicaos/new.json
  def new
    @admin_instituicao = AdminInstituicao.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @admin_instituicao }
    end
  end

  # GET /admin_instituicaos/1/edit
  def edit
    @admin_instituicao = AdminInstituicao.find(params[:id])
  end

  # POST /admin_instituicaos
  # POST /admin_instituicaos.json
  def create
    @admin_instituicao = AdminInstituicao.new(params[:admin_instituicao])

    respond_to do |format|
      if @admin_instituicao.save
        format.html { redirect_success_show("Administrador adicionado com sucesso!",:admin_instituicaos, @admin_instituicao.id)}
        format.json { render json: @admin_instituicao, status: :created, location: @admin_instituicao }
      else
        format.html { render action: "new" }
        format.json { render json: @admin_instituicao.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /admin_instituicaos/1
  # PUT /admin_instituicaos/1.json
  def update
    @admin_instituicao = AdminInstituicao.find(params[:id])

    respond_to do |format|
      if @admin_instituicao.update_attributes(params[:admin_instituicao])
        format.html { redirect_success_show("Administrador alterado com sucesso!",:admin_instituicaos, @admin_instituicao.id)}
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @admin_instituicao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin_instituicaos/1
  # DELETE /admin_instituicaos/1.json
  def destroy
    @admin_instituicao = AdminInstituicao.find(params[:id])
    @admin_instituicao.destroy

    respond_to do |format|
      format.html { redirect_to admin_instituicaos }
      format.json { head :no_content }
    end
  end
end
