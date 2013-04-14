class CandidaturaMailer < ActionMailer::Base
  default from: "from@example.com"
	def candidatura (email, vaga, nome)
	    @nome = nome
	    @vaga = vaga
	    assunto = "Portal de Estágios - Canditato Inscrito na Vaga  " + @vaga
	    mail to: email, subject: assunto
	end
	def contratacao (email, vaga, nome)
	    @nome = nome
	    @vaga = vaga
	    assunto = "Portal de Estágios - Canditato Contratado na Vaga  " + @vaga
	    mail to: email, subject: assunto
	end

end
