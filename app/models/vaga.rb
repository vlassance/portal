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
end
