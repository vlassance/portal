class Aluno < Usuario
  embeds_one :curriculo, cascade_callbacks: true
end
