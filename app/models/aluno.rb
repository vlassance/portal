class Aluno < Usuario
  field :nome, type: String
  embeds_one :curriculo, cascade_callbacks: true
end
