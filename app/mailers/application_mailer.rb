class ApplicationMailer < ActionMailer::Base
  # Change de fault mailer to our mailer
  default from: 'info@getmydata.io'
  layout 'mailer'
end
