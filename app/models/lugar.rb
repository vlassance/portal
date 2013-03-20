class Lugar
  include Mongoid::Document
  field :nome, type: String
  field :endereco, type: String
  field :cep, type: String
  field :cidade, type: String
  field :estado, type: String
  field :telefone, type: String
  field :email, type: String
  field :pais, type: String
  field :descricao, type: String
  field :site, type: String
  field :latitude, type: Float
  field :longitude, type: Float

  #validations
  validates_presence_of :nome, :message => "digite um nome"
  validates_presence_of :endereco, :message => "digite um endereco"
  validates_presence_of :cep, :message => "digite um CEP"
  validates_presence_of :cidade, :message => "digite uma cidade"
  validates_presence_of :estado, :message => "digite um Estado"
  validates_presence_of :pais, :message => "digite um pais"
  validates_presence_of :descricao, :message => "digite uma descricao"
  validates_presence_of :email, :message => "digite um e-mail"
  validates_presence_of :telefone, :message => "digite um telefone"
  validates_uniqueness_of :cnpj,:case_sensitive => true, :message => "cnpj ja cadastrado"
  validates_format_of :email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i , :message => "e-mail invalido" 
  validates_format_of :telefone, :with => /\A([1-9]{2})([- ]{0,1})(\d{3}|\d{4})([- ]{0,1})(\d{4})\Z/, :message => "telefone invalido DDD+numero"
  validates_format_of :cep, :with => /\A(\d{5})([-]{0,1})(\d{3})\Z/, :message => "CEP invalido"

end
