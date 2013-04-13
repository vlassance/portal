class CandidaturasController < ApplicationController
	# GET /candidaturas
	# GET /candidaturas.json
	def index
		if current_usuario.isAdminEmpresa?
			# TODO: Fazer query direto no banco.
			@candidaturas = Candidatura.all.select { |c| c.vaga.empresa.id == current_usuario.empresa_id }
		elsif current_usuario.isAluno?
			@candidaturas = current_usuario.candidaturas
		elsif current_usuario.isAdmin? or current_usuario.isCoordenador?
			@candidaturas = Candidatura.all
		else
			render_404
		end

		respond_to do |format|
			format.html # index.html.erb
			format.json { render json: @candidaturas }
		end
	end

	def candidatar
		if current_usuario.isAluno?
			vaga = Vaga.find(params[:id])

			candidatura = Candidatura.new
			candidatura.aluno = current_usuario
			candidatura.vaga = vaga
			candidatura.aceita = false
			candidatura.validada = false
			candidatura.save
<<<<<<< HEAD
			t1 = Thread.new {CandidaturaMailer.candidatura(candidatura.vaga.empresa.admin_empresa.email, vaga.nome, current_usuario.nome).deliver}
			redirect_success("Candidatura efetuada com sucesso!",:candidaturas, :index)
=======

			redirect_to candidaturas_url
		else
			render_404
		end
	end

	def aceitar
		if current_usuario.isAluno?
			candidatura = Candidatura.find(params[:id])

			avaliacao = AvaliacaoEstagio.new
			avaliacao.aluno = current_usuario
			avaliacao.empresa = candidatura.vaga.empresa
			avaliacao.modulo = candidatura.vaga.modulo
			avaliacao.questionario = Questionario.first
			avaliacao.questionario.perguntas.each do |p|
				r = Resposta.new
				r.pergunta = p
				avaliacao.respostas << r
				r.save
			end
			avaliacao.save

			estagio = Estagio.new
			estagio.aluno = current_usuario
			estagio.empresa = candidatura.vaga.empresa
			estagio.avaliacao_estagio = avaliacao
			estagio.save

			candidatura.destroy

			redirect_to estagios_url
>>>>>>> origin/develop
		elsif current_usuario.isAdminEmpresa?
			candidatura = Candidatura.find(params[:id])
			candidatura.aceita = true
			candidatura.save
			t1 = Thread.new {
				CandidaturaMailer.contratacao(candidatura.aluno.email, vaga.nome, current_usuario.nome).deliver
			}
			redirect_success("Candidatura aprovada com sucesso!",:candidaturas, :index)
		elsif current_usuario.isAdmin? or current_usuario.isCoordenador?
			candidatura = Candidatura.find(params[:id])
			candidatura.validada = true
			candidatura.vaga.numero_vagas = candidatura.vaga.numero_vagas - 1
			candidaturas.vaga.save
			candidatura.save
			redirect_success("Candidatura aprovada com sucesso!",:candidaturas, :index)
		else
			render_404
		end
	end

	def desistir
		candidatura = Candidatura.find(params[:id])
		if current_usuario.isAluno?
			candidatura.destroy
		elsif current_usuario.isAdminEmpresa?
			candidatura.aceita = false
			candidatura.validada = false
			candidatura.save
		elsif current_usuario.isAdmin?
			candidatura.validada = false
			candidatura.save
		else
			render_404
		end
	   redirect_success("Candidatura cancelada com sucesso!",:candidaturas, :index)
	end

end
