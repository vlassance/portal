class Resposta
	include Mongoid::Document

	field :descricao, type: String

	belongs_to :avaliacao, class_name: "AvaliacaoEstagio", inverse_of: :respostas
	belongs_to :pergunta, class_name: "Pergunta", inverse_of: nil

	validates :pergunta, presence: true
	#validates :descricao, presence: true
end
