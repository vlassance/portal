class SignupEmpresaController < ActionController::Base
	def index
	end
	def create
		admin_empresa = AdminEmpresa.new(params[:admin])
		empresa = Empresa.new(params[:empresa])

		empresa.save validate: false
		admin_empresa.empresa = Empresa.find(empresa.id)

		grupo = Grupo.find_by(internal_id: Grupo::ADMIN_EMPRESA)
		admin_empresa.grupo = grupo

		admin_empresa.save validate: false


		admin_empresa = Usuario.find(admin_empresa.id)
		sign_in admin_empresa

		redirect_to "/home"
	end

end