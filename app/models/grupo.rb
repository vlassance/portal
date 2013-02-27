class Grupo
  include Mongoid::Document
  
  field :internal_id, :type => Integer
  field :nome, :type => String
  has_many :usuarios
  has_many :menus
  
  validates_uniqueness_of :nome,:case_sensitive => true, :message => "nome ja existente"
  validates_presence_of :nome, :message => "digite um nome"
  
  
  #constantes
  Grupo::ADMIN = '1'
  # na tela de criar grupos, o internal_id esta considerando que os grupos seguem a ordem crescente...
  # definir se criar grupos sera via CRUD ou seeds.
  
end
