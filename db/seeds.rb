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
puts"**inicio dos seeds"
HistoricoEstagio.destroy_all
Evento.destroy_all
Vaga.destroy_all
Empresa.destroy_all
Menu.destroy_all
Disciplina.destroy_all
HistoricoEstagio.destroy_all
Curso.destroy_all
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
	admin = Grupo.create(:nome => 'Administrador Instituição', :internal_id => Grupo::ADMIN_INSTITUICAO.to_i)
	coordenador = Grupo.create(:nome => 'Coordenador Estágio', :internal_id => Grupo::COORDERNADOR.to_i)
	admin_empresa = Grupo.create(:nome => 'Administrador Empresa', :internal_id => Grupo::ADMIN_EMPRESA.to_i)
	gestor = Grupo.create(:nome => 'Gestor', :internal_id => Grupo::GESTOR.to_i)
	aluno = Grupo.create(:nome => 'Aluno', :internal_id => Grupo::ALUNO.to_i)
puts "Grupos criados com sucesso"	

puts "Criando Usuario Administrador"
	user = AdminInstituicao.create(:nome => 'Administrador ', login: 'admin', :email => 'admin@gmail.com', :password => '12345678', :password_confirmation => '12345678')
	user.grupo = admin
	if user.save(validate: false)
	puts "Usuario administrador criado com sucesso! -> login: admin@gmail.com, senha: 12345678"
else
	puts "*****nao foi possivel criar um usuario, por favor execute db:seed novamente" + user.errors.to_json
end

puts "Criando Usuario Coordenador"
	user = CoordenadorEstagio.create(:nome => 'Coordenador ', login: 'coordenador', :email => 'coordenador@gmail.com', :password => '12345678', :password_confirmation => '12345678')
	user.grupo = coordenador
	if user.save(validate: false)
	puts "Usuario coordenador criado com sucesso! -> login: coordenador@gmail.com, senha: 12345678"
else
	puts "*****nao foi possivel criar um usuario, por favor execute db:seed novamente" + user.errors.to_json
end

puts "Criando Usuario Aluno"
	user = Aluno.create(:nome => 'Aluno ', login: 'aluno', :email => 'aluno@gmail.com', :password => '12345678', :password_confirmation => '12345678')
	user.grupo = aluno
	if user.save(validate: false)
	puts "Usuario aluno criado com sucesso! -> login: aluno@gmail.com, senha: 12345678"
else
	puts "*****nao foi possivel criar um usuario, por favor execute db:seed novamente" + user.errors.to_json
end

puts "Criando Empresa"
	empresa = Empresa.create(:nome => 'Software Express')
	if empresa.save(validate: false)
	puts "empresa criada com sucesso"
else
	puts "*****nao foi possivel criar uma empresa, por favor execute db:seed novamente" + empresa.errors.to_json
end

puts "Criando Admin Empresa"
	user = AdminEmpresa.create(:nome => 'AdminEmpresa ', login: 'empresa', :email => 'empresa@gmail.com', :password => '12345678', :password_confirmation => '12345678')
	user.grupo = admin_empresa
	user.empresa = empresa
	if user.save(validate: false)
	puts "Usuario admin empresa criado com sucesso! -> login: empresa@gmail.com, senha: 12345678"
else
	puts "*****nao foi possivel criar um usuario, por favor execute db:seed novamente" + user.errors.to_json
end

puts "Criando Gestor"
  user = Gestor.create(:nome => 'Gestor ', login: 'empresa', :email => 'gestor@gmail.com', :password => '12345678', :password_confirmation => '12345678')
  user.grupo = gestor
  user.empresa = empresa
  if user.save(validate: false)
  puts "Usuario gestor empresa criado com sucesso! -> login: gestor@gmail.com, senha: 12345678"
else
  puts "*****nao foi possivel criar um usuario, por favor execute db:seed novamente" + user.errors.to_json
end



puts "Criando Menus Basicos"

  menu_empresas = Menu.create(:nome => 'Empresas', :url => '/empresas', :icon => "icon-suitcase", :primary => "empresas")
  menu_empresas.grupos << aluno
  menu_empresas.grupos << admin
  menu_empresas.grupos << coordenador

  menu_alunos = Menu.create(:nome => 'Alunos', :url => '/alunos', :icon => "icon-group", :primary => "alunos")
  menu_alunos.grupos << admin
  menu_alunos.grupos << coordenador

  menu_modulos = Menu.create(:nome => 'Módulos', :url => '/modulos', :icon => "icon-sitemap", :primary => "modulos")
  menu_modulos.grupos << admin
  menu_modulos.grupos << coordenador

  menu_historico = Menu.create(:nome => 'Estágios', :url => '/historico_estagios', :icon => "icon-bar-chart", :primary => "historico")
  menu_historico.grupos << aluno

  menu_eventos = Menu.create(:nome => 'Eventos', :url => '/eventos', :icon => "icon-calendar", :primary => "eventos")
  menu_eventos.grupos << admin
  menu_eventos.grupos << coordenador
  menu_eventos.grupos << gestor
  menu_eventos.grupos << admin_empresa
  menu_eventos.grupos << aluno

  menu_vagas = Menu.create(:nome => 'Vagas', :url => '/vagas', :icon => "icon-list-ul", :primary => "vagas")
  menu_vagas.grupos << admin
  menu_vagas.grupos << coordenador
  menu_vagas.grupos << admin_empresa
  menu_vagas.grupos << aluno

  menu_contatos = Menu.create(:nome => 'Contatos', :url => '/contatos_importantes', :icon => "icon-comment-alt", :primary => "contatos_importantes")
  menu_contatos.grupos << admin
  menu_contatos.grupos << coordenador
  menu_contatos.grupos << gestor
  menu_contatos.grupos << admin_empresa
  menu_contatos.grupos << aluno

  menu_estagiarios = Menu.create(:nome => 'Estagiários', :url => '/alunos', :icon => "icon-group", :primary => "alunos")
  menu_estagiarios.grupos << gestor
  menu_estagiarios.grupos << admin_empresa

  menu_estagio = Menu.create(:nome => 'Estágio Atual', :url => '/estagio', :icon => "icon-github-alt", :primary => "estagios")
  menu_estagio.grupos << aluno

  menu_gestores = Menu.create(:nome => 'Gestores', :url => '/gestor', :icon => "icon-group", :primary => "gestor")
  menu_gestores.grupos << admin_empresa
  puts "Menus criados"
 

 puts "* criando cursos"
 coop = Curso.create(:nome => "Engenharia da Computação", :tipo => "Quadrimestral" )
 semestral = Curso.create(:nome => "Engenharia El;etrica - ênfase em Computação", :tipo => "semestral" )

 puts"Criando disciplinas"
 disciplina = Disciplina.create(:nome => "Estágio Cooperativo I", :sigla => "PCS2091")
 disciplina.curso = coop
 disciplina.save
 
 disciplina = Disciplina.create(:nome => "Estágio Cooperativo II", :sigla => "PCS2092")
 disciplina.curso = coop
 disciplina.save

 disciplina = Disciplina.create(:nome => "Estágio Cooperativo III", :sigla => "PCS2093")
 disciplina.curso = coop
 disciplina.save

 disciplina = Disciplina.create(:nome => "Estágio Cooperativo IV", :sigla => "PCS2094")
 disciplina.curso = coop
 disciplina.save

 disciplina = Disciplina.create(:nome => "Estágio Cooperativo V", :sigla => "PCS2095")
 disciplina.curso = coop
 disciplina.save

 disciplina = Disciplina.create(:nome => "Estágio Supervisionado I", :sigla => "PCS2500")
 disciplina.curso = semestral
 disciplina.save

 disciplina = Disciplina.create(:nome => "Estágio Supervisionado II", :sigla => "PCS2600")
 disciplina.curso = semestral
 disciplina.save
