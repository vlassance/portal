class Aluno < Usuario
	belongs_to :estagio, class_name: "Empresa", inverse_of: :estagiarios
	embeds_one :curriculo, cascade_callbacks: true
	has_many :avaliacoes, class_name: "AvaliacaoEstagio", inverse_of: :aluno
end
