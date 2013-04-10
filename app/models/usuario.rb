class Usuario
  include Mongoid::Document
  include Mongoid::Paperclip

  has_mongoid_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }

  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  ## Confirmable
  # field :confirmation_token,   :type => String
  # field :confirmed_at,         :type => Time
  # field :confirmation_sent_at, :type => Time
  # field :unconfirmed_email,    :type => String # Only if using reconfirmable

  ## Lockable
  # field :failed_attempts, :type => Integer, :default => 0 # Only if lock strategy is :failed_attempts
  # field :unlock_token,    :type => String # Only if unlock strategy is :email or :both
  # field :locked_at,       :type => Time

  ## Token authenticatable
  # field :authentication_token, :type => String
  field :email,              :type => String, :default => ""
  field :encrypted_password, :type => String, :default => ""
  
  ## Recoverable
  field :reset_password_token,   :type => String
  field :reset_password_sent_at, :type => Time

  ## Rememberable
  field :remember_created_at, :type => Time

  ## Trackable
  field :sign_in_count,      :type => Integer, :default => 0
  field :current_sign_in_at, :type => Time
  field :last_sign_in_at,    :type => Time
  field :current_sign_in_ip, :type => String
  field :last_sign_in_ip,    :type => String

  field :nome, :type => String
  field :cpf, :type => String
  field :rg, :type => String
  field :celular, :type => String
  field :telefone, :type => String
  field :cidade, :type => String
  field :estado, :type => String
  field :pais, :type => String
  field :cep, :type => String
  field :endereco, :type => String
  field :sexo, :type => String
  field :estado_civil, :type => Integer
  field :data_nascimento, type: Date
  field :complemento, type: String
  field :bairro, type: String
  field :dump_id, type: Integer
  belongs_to :grupo

  #validations

  validate :check_avatar
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
  validates_confirmation_of :password

  validates_uniqueness_of :email,:case_sensitive => true, :message => "e-mail ja cadastrado"
  validates_uniqueness_of :cpf,:case_sensitive => true, :message => "cpf ja cadastrado"

  validates_format_of :email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i , :message => "e-mail invalido" 
  validates_format_of :telefone, :with => /\A([1-9]{2})([- ]{0,1})(\d{3}|\d{4})([- ]{0,1})(\d{4})\Z/, :message => "telefone invalido DDD+numero"
  validates_format_of :celular, :with => /\A([1-9]{2})([- ]{0,1})(\d{4}|\d{5})([- ]{0,1})(\d{4})\Z/, :message => "celular invalido DDD+numero"
  validates_format_of :cep, :with => /\A(\d{5})([-]{0,1})(\d{3})\Z/, :message => "CEP invalido"
  validates_format_of :cpf, :with => /^\d{10,11}$|\d{3}\.\d{3}\.\d{3}-\d{2}$/, :message => "CPF invalido"

  def check_avatar
    if self.avatar.present?
      dimensions = Paperclip::Geometry.from_file(avatar.queued_for_write[:original].path)
      if dimensions.width > 500 || dimensions.height > 500
        errors.add(:avatar,'A imagem deve ter no maximo 500px x 500px')
      end
    end
  end  

  def isAdmin?
    self.class == AdminInstituicao
  end

  def isAdminEmpresa?
    self.class == AdminEmpresa
  end

  def isAluno?
    self.class == Aluno
  end

  def isGestor?
    self.class == Gestor
  end

  def isCoordenador?
    self.class == CoordenadorEstagio
  end

end
