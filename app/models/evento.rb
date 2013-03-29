class Evento
  include Mongoid::Document
  field :nome, type: String
  field :horarioInicio, type: String
  field :horarioFim, type: String
  field :dataInicio, type: Date
  field :dataFim, type: Date
  field :descricao, type: String

  validates_presence_of :nome, :message => "digite um nome"
  validates_presence_of :descricao, :message => "digite uma descricao"
  validates_presence_of :horarioInicio, :message => "digite um horario"
  validates_presence_of :horarioFim, :message => "digite um horario"
  validates_presence_of :dataInicio, :message => "digite uma data"
  validates_presence_of :dataFim, :message => "digite uma data"

end
