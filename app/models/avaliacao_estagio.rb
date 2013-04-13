class AvaliacaoEstagio
	include Mongoid::Document

	field :nota, type: Integer

	has_many :respostas, class_name: "Resposta", inverse_of: :avaliacao
	belongs_to :aluno
	belongs_to :empresa, class_name: "Empresa", inverse_of: nil
	belongs_to :questionario, class_name: "Questionario", inverse_of: nil
	embeds_one :relatorio_aluno, cascade_callbacks: true
	embeds_one :relatorio_gestor, cascade_callbacks: true
	belongs_to :modulo, class_name: "Modulo", inverse_of: nil

	validates :aluno, presence: true
	validates :empresa, presence: true
	validates :questionario, presence: true

	def editavel?
		return nota == nil
	end
end
