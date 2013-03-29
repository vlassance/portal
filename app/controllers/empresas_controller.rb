class EmpresasController < ApplicationController

  before_filter :check_user, :except => [:show]
  # GET /empresas
  # GET /empresas.json
  def index
    @empresas = Empresa.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @empresas }
    end
  end

  # GET /empresas/1
  # GET /empresas/1.json
  def show
    @empresa = Empresa.find(params[:id])
    @vagas = @empresa.vagas
    @funcionarios = nil
    if current_usuario.isCoordenador? or current_usuario.isAdmin?
      @funcionarios = @empresa.gestor
      @funcionarios << @empresa.admin_empresa
    end
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @empresa }
    end
  end

  # GET /empresas/new
  # GET /empresas/new.json
  def new
    @empresa = Empresa.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @empresa }
    end
  end

  # GET /empresas/1/edit
  def edit
    @empresa = Empresa.find(params[:id])
  end

  # POST /empresas
  # POST /empresas.json
  def create
    @empresa = Empresa.new(params[:empresa])
    @empresa = setLatLong(@empresa)
    respond_to do |format|
      if @empresa.save
        format.html { redirect_success("Empresa adicionada com sucesso!",:empresas, :index)}
        format.json { render json: @empresa, status: :created, location: @empresa }
      else
        format.html { redirect_error("Nao foi possivel adicionar a empresa!",:empresas, :index)}
        format.json { render json: @empresa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /empresas/1
  # PUT /empresas/1.json
  def update
    @empresa = Empresa.find(params[:id])
    empresaFake = Empresa.new(params[:empresa])
    empresaFake = setLatLong(empresaFake)
    @empresa.latitude = empresaFake.latitude
    @empresa.longitude = empresaFake.longitude
    respond_to do |format|
      if @empresa.update_attributes(params[:empresa])
        format.html { redirect_success("Empresa alterada com sucesso!",:empresas, :index)}
        format.json { head :no_content }
      else
        format.html { redirect_error("Nao foi possivel editar a empresa!",:empresas, :index)}
        format.json { render json: @empresa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /empresas/1
  # DELETE /empresas/1.json
  def destroy
    @empresa = Empresa.find(params[:id])
    @empresa.destroy

    respond_to do |format|
        format.html { redirect_success("Empresa removida com sucesso!",:empresas, :index)}
      format.json { head :no_content }
    end
  end

  def setLatLong (lugar)
   begin 
         coordenadas = Geokit::Geocoders::MultiGeocoder.geocode(@instituicao.Endereco + " " + @instituicao.CEP + " " + @instituicao.Cidade + " " + @instituicao.Estado)
          lugar.latitude = coordenadas.lat
          lugar.longitude = coordenadas.lng
        rescue
          # se um endereço não for encontrado, localizated se manterá false
    end  
    return lugar
  end

protected    
    def check_user
      if !current_usuario.isAdmin? && !current_usuario.isCoordenador? && !current_usuario.isAdminEmpresa?
        render_404
      end
    end

end
