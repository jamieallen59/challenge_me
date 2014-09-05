class UsersController < ApplicationController
	def index
		@users = User.where(firstname: params['search'])
	end
end
