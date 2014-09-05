class WelcomeController < ApplicationController
	def index
    @events = current_user ? current_user.events.all : []
	end
end
