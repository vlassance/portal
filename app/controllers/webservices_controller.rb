class WebservicesController  < ActionController::Base 

	def alunos
		render json: Aluno.all.to_json(:force_except => true, :include => :grupo)
	end

	def empresas
		render json: Empresa.all
	end

	def gestores
		render json: Gestor.all.to_json(:force_except => true, :include => :grupo)
	end

	def adminempresas
		render json: AdminEmpresa.all.to_json(:force_except => true, :include => :empresa, :include => :grupo)
	end

	def coordenadores
		render json: CoordenadorEstagio.all.to_json(:force_except => true, :include => :grupo)
	end

	def admininstituicoes
		render json: AdminInstituicao.all.to_json(:force_except => true, :include => :grupo)
	end

	def usuarios
    @usuarios = Usuario.all
    if params[:id]
      @usuarios = @usuarios.where(:_id => params[:id])
    end
    render json: @usuarios.to_json(:force_except => true, :include => [:grupo, :empresa])
	end

	def vagas
		render json: Vaga.all.to_json(:include => :empresa)
	end

	def eventos
		render json: Evento.all
	end
end
