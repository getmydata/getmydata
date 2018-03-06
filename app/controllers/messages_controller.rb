class MessagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_message, only: [:show, :edit, :update, :destroy]
  before_action :generate_token, only: [:create]

  def index
    policy_scope(Message)
    if params[:query].present?
      results = PgSearch.multisearch(params[:query])
      @Messages = []
      results.each do |result|
        @Messages << result.searchable
      end
    else
      @Messages = Message.all
    end
  end

  def show
    authorize @message
  end

  def new
    @message = Message.new
    authorize @message
  end

  def create
    @message = Message.new(message_params)
    @message.user = current_user
    authorize @message
    if @message.save
      redirect_to message_path(@message)
    else
      render :new
    end
  end

  def edit
    # only authorization for admin
  end

  def update
    # only authorization for admin
    @message.update(message_params)
    redirect_to message_path(@message)
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
      params.require(:message).permit(:date, :sent, :subject, :text, :attachment, :user_id, :company_id)
  end

  def generate_token
    self.request_id = loop do
      random_token = SecureRandom.urlsafe_base64(nil, false)
      break random_token unless ModelName.exists?(token: random_token)
    end
  end

end

