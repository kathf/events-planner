class ContactsController < ApplicationController

  def index
    @contacts = Contact.all
  end

  def show
    @contact = Contact.find(params[:id])
  end

  def edit
    @contact = Contact.find(params[:id])
  end

  def update
    @contact = Contact.find(params[:id])
    @contact.update_attributes(contact_params)
    redirect_to contact_url(@contact)
  end

  private
  def contact_params
    params.require(:contact).permit(:name, :company, :phone1, :phone2, :email, :address, :comment)
  end

end
