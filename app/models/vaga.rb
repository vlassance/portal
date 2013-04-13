class Vaga
	include Mongoid::Document

	field :nome, type: String
	field :area, type: String  
	field :descricao, type: String
	field :salario, type: String
	field :requisitos, type: String
	field :beneficios, type: String
	field :contatos, type: String
	field :numero_vagas, type: Integer
	field :data_expiracao, type: Date

	#validations
	validates_presence_of :nome, :message => "digite um nome"
	validates_presence_of :descricao, :message => "digite uma descricao"
	validates_presence_of :salario, :message => "digite um salario"

	validates_presence_of :requisitos, :message => "digite uns requisitos"
	validates_presence_of :beneficios, :message => "digite umas linguas"
	validates_presence_of :contatos, :message => "digite uns contatos"

	validates_presence_of :area, :message => "digite uma area"
	validates_presence_of :numero_vagas, :message => "digite o numero de vagas"
	validates_presence_of :data_expiracao, :message => "digite a data de expiracao"

	belongs_to :empresa
	has_many :candidaturas

end
