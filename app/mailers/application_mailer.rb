class ApplicationMailer < ActionMailer::Base
  # Change de fault mailer to our mailer
  include SendGrid
  default from: 'info@getmydata.io'
  layout 'mailer'
end
