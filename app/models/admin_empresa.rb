class AdminEmpresa < Usuario
  belongs_to :empresa

  has_many :eventos
  
end
