class AdminInstituicao < Usuario
	field :instituicao,  :type => String, :default => "POLI"
	has_many :eventos
end
