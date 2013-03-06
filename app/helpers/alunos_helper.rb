module AlunosHelper
	def extrair_curriculo
		curriculo_seed = params[:aluno].delete(:curriculo)
    	curriculo = Curriculo.new(curriculo_seed)
    	params[:aluno][:curriculo] = curriculo
	end
end
