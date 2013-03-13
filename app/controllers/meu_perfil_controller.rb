class MeuPerfilController < ApplicationController
	def index
		# if user.role == 'aluno'
		@aluno = Aluno.first
		# else if user.role == 'plebs'
		# @plebs = Plebs.first
		# end
	end
end
