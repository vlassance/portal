class DatasMailer < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.datas_mailer.datas.subject
  #
  def datas (email)
    @greeting = "Hi"

    mail to: email, subject: "RailsCasts Weekly"
  end
end
