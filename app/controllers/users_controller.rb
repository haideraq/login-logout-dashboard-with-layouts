class UsersController < ApplicationController
  #layout "admin"
  layout 'admin', :only => [:dashboard,:set_personal_details,:show,:destroy]
  # layout 'index_layout', :only => [:login]

  #before_action :redirect_dashboard
  before_action :authenticate_tutor, :only => [:show] 
  skip_before_action :verify_authenticity_token
  
  def index
  end

  def login
    url = '/'
    @current_user = User.find_by(email: params[:email])
    if @current_user.present?
      @user_match = @current_user.authenticate(params[:password])
      if @user_match.present?
        set_web_tutor_cookies
        url = '/dashboard'
        flash[:success] = "User Logged-In Successfully"
      else
        url = '/' 
        flash[:error] = "Please enter correct Email and Password!" 
      end
    end
    redirect_to url  
  end  

  def new
    @f = User.new
  end

  def show
    @f = User.all
  end

  def create
    @f = User.new(user_params)
    if @f.save
      redirect_to '/'
      flash[:alert] = "Signup has been successfully completed! You can login here"
    else
      render :new
    end
  end

  private

  def user_params
    params.permit(:email, :password)
  end

  def set_web_tutor_cookies
    session[:current_user] = @current_user[:id]
    # if params[:remind_me].present?
    #   cookies[:web_user_email] = params[:email]
    #   cookies[:web_user_password] = params[:password]
    # else
    #   cookies.delete :web_user_email
    #   cookies.delete :web_user_password
    # end
  end

end

