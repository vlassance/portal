class Faq
  include Mongoid::Document

  field :id_assunto, type: Integer
  field :assunto, type: String
  field :pergunta, type: String
  field :resposta, type: String
  
end
