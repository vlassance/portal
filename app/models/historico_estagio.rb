class HistoricoEstagio
  include Mongoid::Document
  field :modulo, type: String
  field :nota, type: Integer
end
