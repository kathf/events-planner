class ContactsController < ApplicationController

  before_action :find_contact, except: [:index, :new, :create]

  def index
    @contacts = Contact.all
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.task = @task
    @contact.event = @event
    redirect_to contact_url(@contact)
  end

  def show; end

  def edit; end

  def update
    @contact.update_attributes(contact_params)
    redirect_to contact_url(@contact)
  end

  def destroy
    @contact.destroy
    redirect_to contacts_url
  end

  private
  def find_contact
    @contact = Contact.find(params[:id])
  end

  def contact_params
    params.require(:contact).permit(:name, :company, :phone1, :phone2, :email, :address, :comment)
  end

end
