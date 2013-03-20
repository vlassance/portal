class AvaliacoesEstagioController < ApplicationController
	def index
		@avaliacoes = AvaliacaoEstagio.all

		respond_to do |format|
			format.html # index.html.erb
			format.json { render json: @avaliacoes }
		end
	end

	def new
		@avaliacao = AvaliacaoEstagio.new

		respond_to do |format|
			format.html
			format.json { render json: @avaliacao }
		end
	end

	def create
		@avaliacao = AvaliacaoEstagio.new(params[:avaliacao])

		@avaliacao.questionario.perguntas.each do |p|
			r = Resposta.new
			r.pergunta = p
			@avaliacao.respostas << r
			r.save
		end

		respond_to do |format|
			if @avaliacao.save
				format.html { redirect_to avaliacoes_estagio_path + "/" + @avaliacao.id, notice: "Avaliacao criada com sucesso!" }
				format.json { render json: @avaliacao, status: :created, location: @avaliacao }
			else
				@avaliacao.respostas.each { |r| r.destroy }
				format.json { render json: @avaliacao.errors, status: :unprocessable_entity }
			end
		end
	end

	def show
		@avaliacao = AvaliacaoEstagio.find(params[:id])

		respond_to do |format|
			format.html # show.html.erb
			format.json { render json: @avaliacao }
		end
	end

	def edit
		@avaliacao = AvaliacaoEstagio.find(params[:id])
	end

end
