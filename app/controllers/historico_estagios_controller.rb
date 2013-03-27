class HistoricoEstagiosController < ApplicationController
  # GET /historico_estagios
  # GET /historico_estagios.json
  before_filter :check_user
  def index
    @historico_estagios = HistoricoEstagio.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @historico_estagios }
    end
  end
  protected    
    def check_user
      if !isAluno?
        render_404
      end
    end
end
