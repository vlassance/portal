class Aluno < Usuario
	has_one :estagio
	embeds_one :curriculo, cascade_callbacks: true
	has_many :avaliacoes, class_name: "AvaliacaoEstagio", inverse_of: :aluno
	field :facebook_id, :type => String
	field :linkedin_id, :type => String
	field :nusp, :type => String
	field :ano_ingresso, type: Integer
	belongs_to :curso
	has_many :candidaturas
end
