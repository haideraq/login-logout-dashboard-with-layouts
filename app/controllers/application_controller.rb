class ApplicationController < ActionController::Base
	
  def authenticate_tutor
    if session[:current_user]
      @current_user = User.where(id:session[:current_user]).first
      if @current_user.present?
        return true
      end
      session[:web_tutor_id] = nil
    end    
      redirect_to '/'
      return false
  end

  def redirect_dashboard
    if session[:current_user]
      @current_web_user = User.where(id:session[:current_user]).first
      redirect_to '/dashboard'
    end  
    
  end  

end
