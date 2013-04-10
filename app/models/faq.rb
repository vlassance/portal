class Faq
  include Mongoid::Document

  field :pergunta, type: String
  field :resposta, type: String
  
end
