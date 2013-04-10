require 'csv'
	desc "Import data from CSV file"
	task csv_empresas: :environment do
		puts 'Importando dados do arquivo .csv. Por favor, aguarde...'
		CSV.foreach("empresas.CSV") do |row|
			e = Empresa.new
			e.dump_id = row[0]
			e.cnpj = row[1]
			e.nome = row[2]
			e.email = row[3]
			e.endereco = row[4].to_s + " " + row[5].to_s + " " + row [11].to_s
			e.cidade = row[6] 
			e.estado = row[7] 
			e.cep = row[8] 
			e.complemento = row[9]
			e.telefone = row[10]
			e.atividades = row[14]
			if !e.save(validate: false)
				puts e.errors.messages
			end
		end
	    puts 'Empresas importadas'
end