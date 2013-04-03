class DataImportante
  include Mongoid::Document
  field :descricao, type: String
  field :data, type: Date
  field :comentario, type: String

  validates_presence_of :descricao, :message => "digite uma descricao"
  validates_presence_of :data, :message => "digite uma data"
  belongs_to :modulo
end
