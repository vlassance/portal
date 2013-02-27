class Lugar
  include Mongoid::Document
  field :nome
  field :endereco
  field :cep
  field :cidade
  field :estado
  field :telefone
  field :email

end
