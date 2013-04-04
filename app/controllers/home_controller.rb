class HomeController < ApplicationController
	def index
		@avisos = DataImportante.where(:data.gte => Date.today) if current_usuario.isAluno?
	end
end