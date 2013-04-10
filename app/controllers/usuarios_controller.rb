class UsuariosController < ApplicationController
  def edit
    @usuario = current_usuario
    if !@usuario.save
      redirect_error("Por favor, preencha os dados a seguir antes de alterar a senha!", :meu_perfil, :index)
    end
  end

  def alterar_senha
    @usuario = Usuario.find(current_usuario.id)
    usuario_sym = @usuario._type.underscore.to_sym
    if @usuario.update_with_password(params[usuario_sym])
      @usuario = Usuario.find(current_usuario.id)
      sign_in @usuario, :bypass => true
      redirect_success_home("Senha alterada com sucesso")
    else
      redirect_error("Insira a senha atual corretamente. A nova senha deve ter 8 ou mais caracteres.", :usuarios, :edit)
    end
  end
end