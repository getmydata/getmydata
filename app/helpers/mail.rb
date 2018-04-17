require 'sendgrid-ruby'
include SendGrid
require 'json'

def hello_world
  from = Email.new(email: 'test@example.com')
  to = Email.new(email: 'info@getmydata.io')
  subject = 'Contact Form'
  content = Content.new(type: 'text/plain', value: 'and easy to do anywhere, even with Ruby')
  mail = Mail.new(from, subject, to, content)

  sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
  response = sg.client.mail._('send').post(request_body: mail.to_json)
  puts response.status_code
  puts response.body
  puts response.headers
end

hello_world
