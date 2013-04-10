require 'csv'
	desc "Import data from CSV file"
	task csv_coordenadores: :environment do
		puts 'Importando dados do arquivo .csv. Por favor, aguarde...'
		CSV.foreach("coordenadores.CSV") do |row|
			e = CoordenadorEstagio.new
			e.nome = row[0]
			e.dump_id = row[1].to_i
			e.telefone = row[2]
			e.email = row[3]
			e.nusp = row[4]
			e.password = e.nusp
			e.password = e.nusp
			if !e.save(validate: false)
				puts e.errors.messages
			end
		end
end