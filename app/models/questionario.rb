class Questionario
	include Mongoid::Document

	field :nome, :type => String
	field :descricao, :type => String
	field :tipo, :type => String

	validates :nome, presence: true
	validates :descricao, presence: true
	QUESTIONARIO_TIPO_FORMAT = /\A(aluno|empresa)\z/
	validates :tipo, presence: true, format: { with: QUESTIONARIO_TIPO_FORMAT }

	has_many :perguntas
end
