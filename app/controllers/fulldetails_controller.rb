class FulldetailsController < ApplicationController
  layout 'admin'
  before_action :authenticate_tutor 
  skip_before_action :verify_authenticity_token

  def index
  end

  def set_personal_details
  end
  
  def show
    @full = Fulldetail.all
  end

  def new
    @full = Fulldetail.new
  end

  def edit
    @full = Fulldetail.find(params[:id])
  end

  def update

    @full = Fulldetail.find(params[:id])

    if @full.update(fulldetail_params)
      redirect_to @full
    else
      render :edit
    end
  end

  def destroy
      
      session[:email] = nil
      redirect_to root_path, notice: 'Logged Out'
    end


  def create
    @full =  Fulldetail.new(fulldetail_params)
    @full.user_id = params[:user_id] || User.first.id

    if @full.save
      redirect_to fulldetail_path(@full)
      flash[:alert] = "Your data is Saved!"
    else
      render :new
    end
 end

  private

  def fulldetail_params
    params.permit(:name, :address, :gender, :country, :dob, :hobbies, :relationship, :contact, :user_id)
  end

end
