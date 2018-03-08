class MessagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_message, only: [:show, :update, :destroy]
  # before_action :generate_token, only: [:create]

  def index
   @user = current_user
   @user_selections = current_user.user_selections.all
   @Messages = Message.all
   policy_scope(Message)
  end

  def send_messages
   @user = current_user
   authorize @user
   @message = Message.new
   @user_selections = current_user.user_selections.all
   @Messages = Message.all
   policy_scope(Message)
  end

  def show
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
    @message.user = current_user
    @message.company = @company
    authorize @message
    if @message.save
      redirect_to company_path(@company)
    else
      render :new
    end
    # raise
  end

  def destroy
    # only authorization for admin
  end

  protected

  def set_message
    @message = message.find(params[:id])
    authorize @message
  end

  def message_params
    params.require(:message).permit(:date, :sent, :subject, :text, :attachment, :user_id, :company_id, :start_date, :end_date)
  end

  # def generate_token
  #   self.request_id = loop do
  #     random_token = SecureRandom.urlsafe_base64(nil, false)
  #     break random_token unless ModelName.exists?(token: random_token)
  #   end
  # end

end

