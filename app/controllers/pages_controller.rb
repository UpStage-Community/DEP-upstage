class PagesController < ApplicationController

	def home

	end

	def about

	end

	def thanks

	end

	def dashboard
		if user_signed_in?
			@companies = current_user.companies
			@productions = current_user.productions
		end
	end

	def denied
	end
end