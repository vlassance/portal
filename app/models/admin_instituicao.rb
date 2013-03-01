class AdminInstituicao
  include Mongoid::Document
  field :nome, type: String
  field :email, type: String
  field :telefone, type: String
  field :dataNascimento, type: Date
  field :rg, type: String
  field :cpf, type: String
end
