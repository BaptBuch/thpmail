class EmailsController < ApplicationController
  require 'faker'
  
  def index
    emails = []
    @emails = Email.all
    @emails.each do |email|
      emails << email
    end
    @all_emails = emails.reverse
  end

  def new
    @email = Email.new
  end


  def create
    @email = Email.new(object: Faker::Fantasy::Tolkien.poem, body: Faker::Lorem.paragraph)
    if @email.save
      respond_to do |format|
        format.html { redirect_to emails_path }
        format.js { }
      end
    else
      respond_to do |format|
        format.html { redirect_to emails_path }
        format.js { }
      end
      flash[:notice] = "Please try again"
    end
  end
  
  def show
    @email = Email.find(params[:id])
    respond_to do |format|
      format.html { }
      format.js { }  
    end
  end

  def destroy
    @email = Email.find(params[:id])
    @email.destroy
    respond_to do |format|
      format.html { }
      format.js { }
    end
  end

  def update
    @email = Email.find(params[:id])

    respond_to do |format|
      format.html { }
      format.js { }
    end
  
  end
  

end
