class Empresa < Lugar
   
  field :pais, type: String
  field :descricao, type: String
  field :site, type: String

  has_one :admin_empresa
end
