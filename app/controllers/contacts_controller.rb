class ContactsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create]

  def new
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
