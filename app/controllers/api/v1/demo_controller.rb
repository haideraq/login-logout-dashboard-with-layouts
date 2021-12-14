class Api::V1::DemoController < ApplicationController

	def index
    full = Fulldetail.all
    render json: full
	end
end