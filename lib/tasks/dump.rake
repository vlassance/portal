	desc "Portal Dump"
	task portal_dump: :environment do
		puts 'Importando dados do portal. Por favor, aguarde...'
		Rake::Task['csv_empresas'].invoke
		Rake::Task['csv_admins'].invoke
		Rake::Task['csv_coordenadores'].invoke
		Rake::Task['csv_alunos'].invoke
		Rake::Task['csv_admin_empresa'].invoke	
	    puts 'Dump Cmmpleto'
	end