require 'csv'
	desc "Import data from CSV file"
	task csv_admins: :environment do
		puts 'Importando dados do arquivo .csv. Por favor, aguarde...'
		CSV.foreach("admins.CSV") do |row|
			e = AdminInstituicao.new
			e.nome = row[1]
			e.dump_id = row[0].to_i
			e.email = row[2]
			e.password = "12345678"
			e.password = "12345678"
      grupo = Grupo.where(internal_id: Grupo::ADMIN_INSTITUICAO).first
      e.grupo = grupo
			if !e.save(validate: false)
				puts e.errors.messages
			end
		end
	    puts 'Admins  importados'

end