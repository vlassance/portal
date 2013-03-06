class Usuario
  include Mongoid::Document

  field :nome, :type => String
  field :email, :type => String
  field :cpf, :type => String
  field :celular, :type => String
  field :telefone, :type => String
  field :cidade, :type => String
  field :estado, :type => String
  field :pais, :type => String
  field :cep, :type => String
  
  #validations
  validates_presence_of :nome, :message => "digite um nome"
  validates_presence_of :endereco, :message => "digite um endereco"
  validates_presence_of :cep, :message => "digite um CEP"
  validates_presence_of :cpf, :message => "digite um CPF"
  validates_presence_of :cidade, :message => "digite uma cidade"
  validates_presence_of :estado, :message => "digite um Estado"
  validates_presence_of :pais, :message => "digite um pais"
  validates_presence_of :celular, :message => "digite um celular"
  validates_presence_of :email, :message => "digite um e-mail"
  validates_presence_of :telefone, :message => "digite um telefone"

  validates_uniqueness_of :email,:case_sensitive => true, :message => "e-mail ja cadastrado"
  validates_uniqueness_of :cpf,:case_sensitive => true, :message => "cpf ja cadastrado"

  validates_format_of :email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i , :message => "e-mail invalido" 
  validates_format_of :telefone, :with => /\A([1-9]{2})([- ]{0,1})(\d{3}|\d{4})([- ]{0,1})(\d{4})\Z/, :message => "telefone invalido DDD+numero"
  validates_format_of :celular, :with => /\A([1-9]{2})([- ]{0,1})(\d{4}|\d{5})([- ]{0,1})(\d{4})\Z/, :message => "celular invalido DDD+numero"
  validates_format_of :cep, :with => /\A(\d{5})([-]{0,1})(\d{3})\Z/, :message => "CEP invalido"
  validates_format_of :cpf, :with => /^\d{10,11}$|\d{3}\.\d{3}\.\d{3}-\d{2}$/, :message => "CPF invalido"  


  belongs_to :grupo

end
