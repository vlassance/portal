class Pergunta
	include Mongoid::Document
	field :descricao, :type => String

	validates :descricao, presence: true

	belongs_to :questionario
end
