class ContactsController < ApplicationController
  
  def index
    @contacts = Contact.all
    if params[:search]
      @contacts = Contact.search(params[:search]).order("last_name DESC")
    else
      @contacts = Contact.all.order('last_name DESC')
    end
  end
  
  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :email, :phone_number)
  end
  
  def new
    @contact = Contact.new
  end
  
  def create
  	@contact = Contact.create(
  	    params.require(:contact).permit(:first_name, :last_name, :email, :phone_number))
  	 redirect_to '/contacts'
  end
  
  def edit
    @contact = Contact.find(params[:id])
  end
  
  def update
    @contact = Contact.find(params[:id])
  	@contact.update_attributes(
  	    params.require(:contact).permit(:first_name, :last_name, :email, :phone_number))
  	 flash[:success] = "Contact updated successfully!"
  	 redirect_to '/contacts'
  end
  
  def show
    @contact = Contact.find(params[:id])
  end
  
  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    flash[:danger] = "Contact has been deleted."
    redirect_to '/contacts'
  end
  
end
