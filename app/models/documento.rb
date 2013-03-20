class Documento
  include Mongoid::Document
  include Mongoid::Paperclip
 
  has_mongoid_attached_file :attachment

  def self.gerar(seed)
  	if !seed.blank?
  		documento = self.new
  		documento.attachment = seed
  	end
  	return documento
  end
end
