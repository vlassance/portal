class Documento
  include Mongoid::Document
  include Mongoid::Paperclip
  embedded_in :aluno
  has_mongoid_attached_file :attachment

  def self.gerar(seed)
  	if !seed.blank?
  		documento = self.new
  		documento.attachment = seed
  	end
  	return documento
  end
end
