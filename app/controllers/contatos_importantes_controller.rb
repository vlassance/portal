class ContatosImportantesController < ApplicationController
  # GET /contatos_importantes
  # GET /contatos_importantes.json
  def index
    @contatos_importantes = ContatosImportante.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @contatos_importantes }
    end
  end
end
