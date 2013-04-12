require 'csv'
	desc "Import data from CSV file"
	task csv_alunos: :environment do
		puts 'Importando dados do arquivo .csv. Por favor, aguarde...'
		coop = Curso.where(:tipo => "Quadrimestral" ).first
        semestral = Curso.where(:tipo => "Semestral" ).first
		CSV.foreach("alunos.CSV") do |row|
			e = Aluno.new
			e.dump_id = row[0]
			e.nusp = row[1]
			e.nome = row[2]
			if row[3].to_s == "Quadrimestral"
				e.curso = coop
			else
				e.curso = semestral
			end
			e.ano_ingresso = row[4].to_i
			e.data_nascimento = row[5].to_s if !row[5].blank?
			e.estado_civil = row[6]
			e.sexo = row[7]
			e.telefone = row[8]
			e.email = row[9]
			e.rg = row[10]
			e.cpf = row[11]
			e.password = e.nusp
			e.password_confirmation = e.nusp
			e.endereco = row[12].to_s + " " + row[13].to_s 
			e.complemento = row[14].to_s
			e.bairro = row[15].to_s
			e.cidade = row[16] 
			e.estado = row[17] 
			e.cep = row[18]
      grupo = Grupo.where(internal_id: Grupo::ALUNO).first
      e.grupo = grupo
			if !e.save(validate: false)
				puts e.errors.messages
			end
		end
	    puts 'Alunos importados'
end