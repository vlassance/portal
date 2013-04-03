class Modulo
  include Mongoid::Document
  field :nome, type: String
  field :ano, type: Integer
  field :dataInicio, type: Date
  field :dataFim, type: Date
end
