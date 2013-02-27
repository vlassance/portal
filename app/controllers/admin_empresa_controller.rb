class AdminEmpresaController < ApplicationController
  # GET /admin_empresa
  # GET /admin_empresa.json
  def index
    @admin_empresa = AdminEmpresa.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @admin_empresa }
    end
  end

  # GET /admin_empresa/1
  # GET /admin_empresa/1.json
  def show
    @admin_empresa = AdminEmpresa.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @admin_empresa }
    end
  end

  # GET /admin_empresa/new
  # GET /admin_empresa/new.json
  def new
    @admin_empresa = AdminEmpresa.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @admin_empresa }
    end
  end

  # GET /admin_empresa/1/edit
  def edit
    @admin_empresa = AdminEmpresa.find(params[:id])
  end

  # POST /admin_empresa
  # POST /admin_empresa.json
  def create
    @admin_empresa = AdminEmpresa.new(params[:admin_empresa])

    respond_to do |format|
      if @admin_empresa.save
        format.html { redirect_to @admin_empresa, notice: 'Admin empresa was successfully created.' }
        format.json { render json: @admin_empresa, status: :created, location: @admin_empresa }
      else
        format.html { render action: "new" }
        format.json { render json: @admin_empresa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /admin_empresa/1
  # PUT /admin_empresa/1.json
  def update
    @admin_empresa = AdminEmpresa.find(params[:id])

    respond_to do |format|
      if @admin_empresa.update_attributes(params[:admin_empresa])
        format.html { redirect_to @admin_empresa, notice: 'Admin empresa was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @admin_empresa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin_empresa/1
  # DELETE /admin_empresa/1.json
  def destroy
    @admin_empresa = AdminEmpresa.find(params[:id])
    @admin_empresa.destroy

    respond_to do |format|
      format.html { redirect_to admin_empresa_index_url }
      format.json { head :no_content }
    end
  end
end
