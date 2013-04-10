class Disciplina
  include Mongoid::Document
  field :nome, type: String
  field :sigla, type: String
  belongs_to :curso
end
