class UsersController < ApplicationController
	def index
		@users = User.where(firstname: params['search'])
	end
	def profile
		@user = User.find(params[:user_id])
		@event_id = params[:event_id]
	end

	def update
		@user = User.find(params[:id])
		@user.update_attributes(params[:user].permit(:avatar))
		flash[:notice] = 'Profile picture updated'
		redirect_to event_path(params[:event_id])
	end
end
