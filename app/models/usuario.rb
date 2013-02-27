class Usuario
  include Mongoid::Document
  field :name
  field :email
  field :cpf
  field :celular
  field :cidade
  field :cep
  
  belongs_to :grupo
end
