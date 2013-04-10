class Aluno < Usuario
	has_one :estagio
	embeds_one :curriculo, cascade_callbacks: true
	has_many :avaliacoes, class_name: "AvaliacaoEstagio", inverse_of: :aluno
	has_many :candidaturas
	field :facebook_id
	field :linkedin_id
end
