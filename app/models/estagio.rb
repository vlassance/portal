class Estagio
	include Mongoid::Document
	belongs_to :aluno
	belongs_to :empresa
	belongs_to :avaliacao_estagio, class_name: "AvaliacaoEstagio", inverse_of: nil
end
