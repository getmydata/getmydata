require 'sendgrid-ruby'
include SendGrid
require 'json'

class ContactsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create, :hello_world]

  def hello_world
    from = Email.new(email: 'test@example.com')
    to = Email.new(email: 'work@pim.gg')

    if request.original_url.include?('3000')
      subject = 'TEST from dev'
      content = Content.new(type: 'text/plain', value: 'TEST from dev')
    elsif request.original_url.include?('staging')
      subject = 'TEST from staging'
      content = Content.new(type: 'text/plain', value: 'TEST from staging')
    else
      subject = 'TEST from production'
      content = Content.new(type: 'text/plain', value: 'TEST from production')
    end

    mail = Mail.new(from, subject, to, content)

    sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
    response = sg.client.mail._('send').post(request_body: mail.to_json)
    puts response.status_code
    puts response.body
    puts response.headers
  end

  def new
    @contact = Contact.new
    authorize @contact

    hello_world
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    authorize @contact
    # if @contact.save
    #   flash[:notice] = 'Thank you for your message. We will contact you soon!'
    #   redirect_to root_path
    # else
    #   flash[:error] = 'Cannot send message.'
    #   render :new
    # end
  end
end
