class Evento
  include Mongoid::Document
  field :nome, type: String
  field :horarioInicio, type: String
  field :horarioFim, type: String
  field :dataInicio, type: String
  field :dataFim, type: String
  field :descricao, type: String
end
