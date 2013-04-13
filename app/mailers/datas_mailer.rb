class DatasMailer < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.datas_mailer.datas.subject
  #
    def datas (email, data, nome, descricao)
      @data = data
      @nome = nome
      @detalhes = descricao
      evento = "Portal de Estagios - Evento " + @nome
      mail to: email, subject: evento
  end
end