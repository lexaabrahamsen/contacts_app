class Api::ContactsController < ApplicationController
  def index
    @contacts = Contact.all
    render 'index.json.jb'
  end

  def create
    @contact = Contact.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      phone_number:[:phone_number]
    )

    @contact.save
    render 'create.json.jb'
  end

  def show
    the_id = params[:id]
    @contact = Contact.find_by(id: the_id)
    render 'show.json.jb'
  end

  def update
    # find the item and show
    the_id = params[:id]
    @contact = Contact.find_by(id: params[:id])
    # change the contact
    @contact.first_name = params[:first_name],
    @contact.last_name = params[:last_name],
    @contact.phone_number = params[:phone_number]
    @contact.save
    render 'show.json.jb'
  end

end
