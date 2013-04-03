class DataImportante
  include Mongoid::Document
  field :descricao, type: String
  field :data, type: Date
  field :comentario, type: String
end
