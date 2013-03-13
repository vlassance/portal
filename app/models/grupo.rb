class Grupo
  include Mongoid::Document
  
  field :internal_id, :type => Integer
  field :nome, :type => String
  has_many :usuarios
  #has_many :menus
  
  validates_uniqueness_of :nome,:case_sensitive => true, :message => "nome ja existente"
  validates_presence_of :nome, :message => "digite um nome"
  
  
  #constantes
  Grupo::ADMIN_INSTITUICAO = '1'
  Grupo::COORDERNADOR = '2'
  Grupo::ADMIN_EMPRESA = '3'
  Grupo::GESTOR = '4'
  Grupo::ALUNO = '5'

  
end
