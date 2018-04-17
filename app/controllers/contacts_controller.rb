class ContactsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create]

require 'sendgrid-ruby'
include SendGrid

def send_mail
  from = Email.new(email: 'test@example.com')
  to = Email.new(email: 'test@example.com')
  subject = 'Sending with SendGrid is Fun'
  content = Content.new(type: 'text/plain', value: 'and easy to do anywhere, even with Ruby')
  mail = Mail.new(from, subject, to, content)

  sg = SendGrid::API.new(api_key: ENV['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'])
  response = sg.client.mail._('send').post(request_body: mail.to_json)
  puts response.status_code
  puts response.body
  puts response.headers
end

def new
  send_mail

  @contact = Contact.new
  authorize @contact
end

def create
  @contact = Contact.new(params[:contact])
  @contact.request = request
  authorize @contact
  if @contact.deliver
    flash[:notice] = 'Thank you for your message. We will contact you soon!'
    redirect_to root_path
  else
    flash[:error] = 'Cannot send message.'
    render :new
  end
end
end
