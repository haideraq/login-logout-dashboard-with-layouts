class DashboardController < ApplicationController
	layout 'admin'
	before_action :authenticate_tutor
	skip_before_action :verify_authenticity_token

	def index

	end

	def logout
		session[:current_user] = nil
		flash[:success] = 'User logout successfully'
        redirect_to '/'
    end

end
