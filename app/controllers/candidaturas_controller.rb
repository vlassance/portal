class CandidaturasController < ApplicationController
	# GET /candidaturas
	# GET /candidaturas.json
	def index
		if current_usuario.isAdminEmpresa?
			@candidaturas = Array.new
			current_usuario.empresa.vagas.each do |vaga|
				@candidaturas << vaga.candidaturas
			end
		elsif current_usuario.isAluno?
			@candidaturas = current_usuario.candidaturas
		elsif current_usuario.isAdmin?
			@candidatura = Candidatura.all
		else
			render_404
		end

		respond_to do |format|
			format.html # index.html.erb
			format.json { render json: @candidaturas }
		end
	end

	def candidatarse
		if !current_usuario.isAluno?
			render_404
		end
		vaga = Vaga.find(params[:id])

		candidatura = Candidatura.new
		candidatura.aluno = current_usuario
		candidatura.vaga = vaga
		candidatura.aceita = false
		if candidatura.save
			redirect_to candidaturas_url
		end
	end

	def desistir
		@candidatura = Candidatura.find(params[:id])
		@candidatura.destroy

		respond_to do |format|
			format.html { redirect_to candidaturas_url }
			format.json { head :no_content }
		end
	end
end
