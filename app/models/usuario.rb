class Usuario
  include Mongoid::Document
  field :nome
  field :email
  field :cpf
  field :celular
  field :telefone
  field :cidade
  field :estado
  field :pais
  field :cep
  
  belongs_to :grupo
end
