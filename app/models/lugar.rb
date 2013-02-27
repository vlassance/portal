class Lugar
  include Mongoid::Document
  field :nome, type: String
  field :endereco, type: String
  field :cep, type: String
  field :cidade, type: String
  field :estado, type: String
  field :telefone, type: String
  field :email, type: String
  field :pais, type: String
  field :descricao, type: String
  field :site, type: String

end
