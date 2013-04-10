class MeuPerfilController < ApplicationController
	def index
		@edit = true
		if current_usuario.isAdmin?
			@perfil 				= AdminInstituicao.to_s.pluralize.underscore
			@admin_instituicao 		= AdminInstituicao.find(current_usuario.id)
		elsif current_usuario.isAdminEmpresa?
			@perfil 				= AdminEmpresa.to_s.pluralize.underscore
			@admin_empresa 			= AdminEmpresa.find(current_usuario.id)
		elsif current_usuario.isAluno?
			@perfil 				= Aluno.to_s.pluralize.underscore
			@aluno 					= Aluno.find(current_usuario.id)
		elsif current_usuario.isGestor?
			@perfil 				= Gestor.to_s.pluralize.underscore
			@gestor 				= Gestor.find(current_usuario.id)
		elsif current_usuario.isCoordenador?
			@perfil 				= CoordenadorEstagio.to_s.pluralize.underscore
			@coordenador_estagio 	= CoordenadorEstagio.find(current_usuario.id) 
		end
	end
end
