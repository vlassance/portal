class EstagiosController < ApplicationController
	def index
		@estagios = nil
		if current_usuario.isAluno?
			if current_usuario.estagio?
				@estagios = Array.new
				@estagios << current_usuario.estagio
			end
		elsif current_usuario.isAdminEmpresa? or current_usuario.isGestor?
			@estagios = current_usuario.empresa.estagios
		elsif current_usuario.isAdmin? or current_usuario.isCoordenador?
			@estagios = Estagio.all
		else
			render_404
		end

		respond_to do |format|
			format.html # index.html.erb
			format.json { render json: @avaliacoes }
		end
	end

end

