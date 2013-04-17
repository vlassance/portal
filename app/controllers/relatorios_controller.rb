class RelatoriosController < ApplicationController
  
  def index
    @modulos = Modulo.all
    @mod = Modulo.first._id
    if not params[:modulo].nil? and not params[:modulo][:id].nil?
      @mod = params[:modulo][:id]
      @qtde_estagios = {}
      # Dummy data para testar os relatórios
      if params[:modulo][:id] != "516ed21b69ca9cb44e000004"
        @qtde_estagios["I.ndigo"] = 2
        @qtde_estagios["Software Express"] = 3
        @qtde_estagios["CertSys"] = 4
      end
      @candidaturas = Candidatura.where(validada: true, aceita: true)
      @candidaturas.each do |cand|
        if cand.vaga.modulo._id.to_s == params[:modulo][:id]
          if @qtde_estagios[cand.vaga.empresa.nome].nil?
            @qtde_estagios[cand.vaga.empresa.nome] = 1
          else
            @qtde_estagios[cand.vaga.empresa.nome] += 1
          end
        end
      end
    end

    respond_to do |format|
      format.html # index.html.erb
    end
  end

end
