# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Menu.create(:nome => 'Home', :url => '/home')
#Menu.create(:nome => 'Usuarios', :url => '/users')
#Menu.create(:nome => 'Grupos de Acesso', :url => '/grupos')
HistoricoEstagio.destroy_all
Evento.destroy_all
Vaga.destroy_all
Empresa.destroy_all
HistoricoEstagio.create(modulo: "1", nota: 10)
HistoricoEstagio.create(modulo: "2", nota: 9)
HistoricoEstagio.create(modulo: "3", nota: 10)
HistoricoEstagio.create(modulo: "4", nota: 8)
HistoricoEstagio.create(modulo: "5", nota: 8)

puts "Removendo usuarios..."
Usuario.destroy_all
puts "Usuarios removidos com sucesso"
puts "Removendo groups..."
Grupo.destroy_all
puts "Grupos removidos com sucesso"

puts "Criando Grupos"
	admin = Grupo.create(:name => 'Administrador Instituição', :internal_id => Grupo::ADMIN_INSTITUICAO.to_i)
	coordenador = Grupo.create(:name => 'Coordenador Estágio', :internal_id => Grupo::COORDERNADOR.to_i)
	admin_empresa = Grupo.create(:name => 'Administrador Empresa', :internal_id => Grupo::ADMIN_EMPRESA.to_i)
	gestor = Grupo.create(:name => 'Gestor', :internal_id => Grupo::GESTOR.to_i)
	aluno = Grupo.create(:name => 'Aluno', :internal_id => Grupo::ALUNO.to_i)
puts "Grupos criados com sucesso"	

puts "Criando Usuario Administrador"
	user = AdminInstituicao.create(:name => 'Administrador ', login: 'admin', :email => 'admin@gmail.com', :password => '12345678', :password_confirmation => '12345678')
	user.grupo = admin
	if user.save(validate: false)
	puts "Usuario administrador criado com sucesso! -> login: admin@gmail.com, senha: 12345678"
else
	puts "*****nao foi possivel criar um usuario, por favor execute db:seed novamente" + user.errors.to_json
end

puts "Criando Usuario Coordenador"
	user = CoordenadorEstagio.create(:name => 'Coordenador ', login: 'coordenador', :email => 'coordenador@gmail.com', :password => '12345678', :password_confirmation => '12345678')
	user.grupo = coordenador
	if user.save(validate: false)
	puts "Usuario coordenador criado com sucesso! -> login: coordenador@gmail.com, senha: 12345678"
else
	puts "*****nao foi possivel criar um usuario, por favor execute db:seed novamente" + user.errors.to_json
end

puts "Criando Usuario Aluno"
	user = Aluno.create(:name => 'Aluno ', login: 'aluno', :email => 'aluno@gmail.com', :password => '12345678', :password_confirmation => '12345678')
	user.grupo = aluno
	if user.save(validate: false)
	puts "Usuario aluno criado com sucesso! -> login: aluno@gmail.com, senha: 12345678"
else
	puts "*****nao foi possivel criar um usuario, por favor execute db:seed novamente" + user.errors.to_json
end

puts "Criando Empresa"
	empresa = Empresa.create(:name => 'Software Express')
	if empresa.save(validate: false)
	puts "empresa criada com sucesso"
else
	puts "*****nao foi possivel criar uma empresa, por favor execute db:seed novamente" + empresa.errors.to_json
end

puts "Criando Admin Empresa"
	user = AdminEmpresa.create(:name => 'AdminEmpresa ', login: 'empresa', :email => 'empresa@gmail.com', :password => '12345678', :password_confirmation => '12345678')
	user.grupo = admin_empresa
	user.empresa = empresa
	if user.save(validate: false)
	puts "Usuario admin empresa criado com sucesso! -> login: empresa@gmail.com, senha: 12345678"
else
	puts "*****nao foi possivel criar um usuario, por favor execute db:seed novamente" + user.errors.to_json
end