class Empresa < Lugar   
  field :cnpj, type: String	
  
  has_one :admin_empresa
  has_many :gestor
  has_many :vagas
  
  validates_presence_of :cnpj, :message => "digite um cnpj"

end
