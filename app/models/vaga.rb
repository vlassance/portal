class Vaga
  include Mongoid::Document

  field :nome, type: String
  field :descricao, type: String
  field :salario, type: String
  field :requisitos, type: String
  field :linguas, type: String
  field :conhecimentos, type: String
  field :area, type: String
  field :numero_vagas, type: Integer

  #validations
  validates_presence_of :nome, :message => "digite um nome"
  validates_presence_of :descricao, :message => "digite uma descricao"
  validates_presence_of :salario, :message => "digite um salario"
  validates_presence_of :requisitos, :message => "digite uns requisitos"
  validates_presence_of :linguas, :message => "digite umas linguas"
  validates_presence_of :conhecimentos, :message => "digite uns conhecimentos"
  validates_presence_of :area, :message => "digite uma area"
  validates_presence_of :numero_vagas, :message => "digite o numero de vagas"

  belongs_to :empresa
end
