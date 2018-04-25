require 'sendgrid-ruby'
require 'json'

include SendGrid

class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:send_messages, :show]
  before_action :set_company, only: [:edit, :update]

  def index
    policy_scope(Message)
    @messages = current_user.messages.ordered
  end

  def hello_world(company, message)
    from = Email.new(email: "test+#{current_user.auth_token}@example.com")
    to = Email.new(email: 'hello@pim.gg')

    if request.original_url.include?('3000')
      subject = 'TEST from dev'
      content = Content.new(type: 'text/plain', value: "#{company.email} #{current_user} #{current_user.first_name} #{current_user.last_name} #{message.text}")
    elsif request.original_url.include?('staging')
      subject = 'TEST from staging'
      content = Content.new(type: 'text/plain', value: 'TEST from staging')
    else
      subject = 'TEST from production'
      content = Content.new(type: 'text/plain', value: 'TEST from production')
    end

    mail = SendGrid::Mail.new(from, subject, to, content)
    sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
    response = sg.client.mail._('send').post(request_body: mail.to_json)
    puts response.status_code
    puts response.body
    puts response.headers
  end

  def send_messages
    authorize @user
    @message = Message.new
    set_messages
  end

  def show
    policy_scope(Message)
  end

  def new
    @message = Message.new
    @company = Company.find(params[:company_id])
    authorize @message
  end

  def create
    @message = Message.new(message_params)
    @message.created_at = Time.now
    @company = Company.find(params[:company_id])

    @message.company = @company
    authorize @message
    if @message.save
      hello_world(@company, @message)
      respond_to do |format|
        format.html
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { render :new }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    end
  end

  def edit

  end

  def update
    @message.update(message_params)
    redirect_to messages_path
  end

  def destroy
    # only authorization for admin
    @message.destroy
    redirect_to messages_path, :alert => "Message deleted"
  end

  protected

  # strong params for messages
  def message_params
    params.require(:message).permit(:date, :sent_by_user, :subject, :text, :attachment, :request_id, :user_id, :company_id, :start_date, :end_date)
  end

  # Defines user selections, messages and Message-policy scope
  def set_messages
    @user_selections = @user.user_selections.all
    gon.userSelections = @user_selections


    @messages = Message.all
    policy_scope(Message)
  end

  # Defines a specific message
  def set_message
    @message = Message.find(params[:id])
    authorize @message
  end

  # Defines user as current user
  def set_user
   @user = current_user
 end

  # Defines a specific company and
  def set_company
    @company = Company.find(params[:company_id])
    @message.company = @company
  end
end
