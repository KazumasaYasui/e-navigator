class ApplicationMailer < ActionMailer::Base
  default from: ENV['E_MAIL']
  layout 'mailer'
end
