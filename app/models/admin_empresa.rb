class AdminEmpresa < Usuario
  include Mongoid::Document
  belongs_to :empresa
end
