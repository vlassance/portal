class Modulo
  include Mongoid::Document
  field :nome, type: String
  field :ano, type: Integer
  field :dataInicio, type: Date
  field :dataFim, type: Date

  validates_presence_of :nome, :message => "digite um nome"
  validates_presence_of :ano, :message => "digite um ano"
  validates_presence_of :dataInicio, :message => "digite uma data"
  validates_presence_of :dataFim, :message => "digite uma data"

  has_many :data_importantes

end
