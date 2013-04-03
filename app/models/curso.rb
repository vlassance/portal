class Curso
  include Mongoid::Document
  field :nome, type: String
  field :tipo, type: String
end
