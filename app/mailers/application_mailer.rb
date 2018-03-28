class ApplicationMailer < ActionMailer::Base
  # Change de fault mailer to our mailer
  default from: 'from@example.com'
  layout 'mailer'
end
