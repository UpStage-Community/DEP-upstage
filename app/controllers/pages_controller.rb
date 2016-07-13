class PagesController < ApplicationController
  
	def home
		p "*" * 80
		p current_user
	end
	
	def about

	end

	def thanks
		p params
	end

end