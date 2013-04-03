class Candidatura
  include Mongoid::Document
  field :aceita, type: Boolean
  field :validada, type: Boolean

  belongs_to :aluno
  belongs_to :vaga
end
