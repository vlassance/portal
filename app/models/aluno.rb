class Aluno
  include Mongoid::Document
  field :nome, type: String
  embeds_one :curriculo, cascade_callbacks: true
end