class VagasController < ApplicationController
	# GET /vagas
	# GET /vagas.json
	before_filter :check_user, :except => [:show, :index, :candidatura]

	def index
		@vagas = Vaga.all

		respond_to do |format|
			format.html # index.html.erb
			format.json { render json: @vagas }
		end
	end

	# GET /vagas/1
	# GET /vagas/1.json
	def show
		@vaga = Vaga.find(params[:id])
		respond_to do |format|
			format.html # show.html.erb
			format.json { render json: @vaga }
		end
	end

	# GET /vagas/new
	# GET /vagas/new.json
	def new
		@vaga = Vaga.new

		respond_to do |format|
			format.html # new.html.erb
			format.json { render json: @vaga }
		end
	end

	# GET /vagas/1/edit
	def edit
		@vaga = Vaga.find(params[:id])
	end

	# POST /vagas
	# POST /vagas.json
	def create
		@vaga = Vaga.new(params[:vaga])

		respond_to do |format|
			if @vaga.save
				format.html { redirect_success("Vaga criada com sucesso!",:vagas, :index)}
				format.json { render json: @vaga, status: :created, location: @vaga }
			else
				format.html { redirect_error("Erro ao adicionar a vaga! #{@vaga.errors.full_messages}",:vagas, :index)}
				format.json { render json: @vaga.errors, status: :unprocessable_entity }
			end
		end
	end

	# PUT /vagas/1
	# PUT /vagas/1.json
	def update
		@vaga = Vaga.find(params[:id])

		respond_to do |format|
			if @vaga.update_attributes(params[:vaga])
				format.html { redirect_success("Vaga editada com sucesso!",:vagas, :index)}
				format.json { head :no_content }
			else
				format.html { redirect_error("Erro ao alterar a vaga!",:vagas, :index)}
				format.json { render json: @vaga.errors, status: :unprocessable_entity }
			end
		end
	end

	# DELETE /vagas/1
	# DELETE /vagas/1.json
	def destroy
		@vaga = Vaga.find(params[:id])
		@vaga.destroy

		respond_to do |format|
			format.html { redirect_to vagas_url }
			format.json { head :no_content }
		end
	end

	def candidatura
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

	protected    
	def check_user
		if !current_usuario.isAdmin? && !current_usuario.isCoordenador? && !current_usuario.isAdminEmpresa?
			render_404
		end
	end

end
