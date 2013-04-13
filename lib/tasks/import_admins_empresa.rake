require 'csv'
	desc "Import data from CSV file"
	task csv_admin_empresa: :environment do
		puts 'Importando dados do arquivo .csv. Por favor, aguarde...'
		CSV.foreach("admin_empresas.CSV") do |row|
			e = AdminEmpresa.new
			e.nome = row[2]
			e.dump_id = row[0].to_i
			empresa = Empresa.where(:dump_id => row[1].to_i).first
			e.empresa = empresa
			e.email = row[3]
			e.telefone = row[4]
			e.celular = row[5]
			e.password = "12345678"
			e.password = "12345678"
      grupo = Grupo.where(internal_id: Grupo::ADMIN_EMPRESA).first
      e.grupo = grupo
			if !e.save(validate: false)
				puts e.errors.messages
			end
		end
	    puts 'Admin Empresas importados'
end