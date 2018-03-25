class MessagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :destroy]
  skip_before_action :verify_authenticity_token
  before_action :set_message, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:index, :send_messages, :show]
  before_action :set_messages, only: [:index]
  before_action :set_company, only: [:edit, :update]

  def index

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

    # Code below is the standard to set current_user to message.user_id. For the demo I have to work around this. Reset after demo!!!!!!!
    # @message.user = current_user
    @message.company = @company
    authorize @message
    if @message.save
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
    redirect_to user_messages_path(:user_id)
  end

  def destroy
    # only authorization for admin
    @message.destroy
    redirect_to user_messages_path(current_user.id), :alert => "Message deleted"
  end

  protected

  # strong params for messages
  def message_params
    params.require(:message).permit(:date, :sent_by_user, :subject, :text, :attachment, :request_id, :user_id, :company_id, :start_date, :end_date)
  end

  # Defines user selections, messages and Message-policy scope
  def set_messages
    @user_selections = @user.user_selections.all
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
