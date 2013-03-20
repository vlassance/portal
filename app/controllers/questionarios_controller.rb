class QuestionariosController < ApplicationController
	def index
		@questionarios = Questionario.all

		respond_to do |format|
			format.html # index.html.erb
			format.json { render json: @questionarios }
		end
	end

	def new
		@questionario = Questionario.new

		respond_to do |format|
			format.html
			format.json { render json: @questionario }
		end
	end

	def edit
		@questionario = Questionario.find(params[:id])
	end

	def create
		@questionario = Questionario.new(params[:questionario])
		# FIXME: Porque não utilizar @questionario.perguntas direto?
		perguntas = Array.new

		params[:pergunta].each_value do |v|
			p = Pergunta.new(descricao: v)
			@questionario.perguntas << p
			perguntas << p
		end

		# Precisa disso ou @questionario.save já salva?
		salvou_perguntas = true
		perguntas.size.times do |i|
			if !perguntas[i].save
				puts "nao salvou pergunta #{i}! rollback..."
				(i - 1).times do |j|
					perguntas[j].destroy
				end
				salvou_perguntas = false
				break
			end
		end

		salvou_questionario = false
		if salvou_perguntas
			if !@questionario.save
				perguntas.each { |p| p.destroy }
			else
				salvou_questionario = true
			end
		end

		respond_to do |format|
			if salvou_questionario and salvou_perguntas
				format.html { redirect_to @questionario, notice: 'Questionario criado com sucesso!' }
				format.json { render json: @questionario, status: :created, location: @questionario }
			else
				format.html { render action: "new" }
				if !salvou_perguntas
					# FIXME: Mostrar mensagem de erro de perguntas.
					perguntas.each do |p|
						if !p.errors.any?
							format.json { render json: p.errors, status: :unprocessable_entity }
							break
						end
					end
				else # !salvou_questionario
					format.json { render json: @questionario.errors, status: :unprocessable_entity }
				end
			end
		end
	end

	# TODO: update

	def show
		@questionario = Questionario.find(params[:id])

		respond_to do |format|
			format.html # show.html.erb
			format.json { render json: @questionario }
		end
	end

	def destroy
		@questionario = Questionario.find(params[:id])
		@questionario.destroy

		respond_to do |format|
			format.html { redirect_to questionarios_url }
			format.json { head :no_content }
		end
	end

end
