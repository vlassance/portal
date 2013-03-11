class HistoricoEstagiosController < ApplicationController
  # GET /historico_estagios
  # GET /historico_estagios.json
  def index
    @historico_estagios = HistoricoEstagio.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @historico_estagios }
    end
  end
end
