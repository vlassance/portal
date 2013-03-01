# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :admin_instituicao do
    nome "MyString"
    email "MyString"
    telefone "MyString"
    dataNascimento "2013-03-01"
    rg "MyString"
    cpf "MyString"
  end
end
