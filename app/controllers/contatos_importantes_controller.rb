class ContatosImportantesController < ApplicationController

  def index

	@coordenador = CoordenadorEstagio.all

    @faqs = []
    path = "http://143.107.102.37:3001/faqs.json"

    response = RestClient.get path, {:accept => :json}
    faqs_json = JSON.parse response

    faqs_json.each do |f_json|
      if params[:assunto].nil? or params[:assunto].to_i == f_json["subject"]["id"].to_i
      	faq = Faq.new
        faq.id_assunto = f_json["subject"]["id"]
        faq.assunto = f_json["subject"]["subject"]
      	faq.pergunta = f_json["question"]
      	faq.resposta = f_json["answer"]
      	@faqs << faq
      end
    end
  end
end
