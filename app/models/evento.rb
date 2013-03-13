class Evento
  include Mongoid::Document
  field :nome, type: String
  field :horarioInicio, type: String
  field :horarioFim, type: String
  field :dataInicio, type: Date
  field :dataFim, type: Date
  field :descricao, type: String
end
