class Curso
  include Mongoid::Document
  field :nome, type: String
  field :tipo, type: String
  has_many :disciplinas
  has_many :alunos
end
