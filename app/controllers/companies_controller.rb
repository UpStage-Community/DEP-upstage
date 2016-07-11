class CompaniesController < ApplicationController

	def index
		@companies = Company.all
	end

	def new
		@company = Company.new
	end

	def create
		p params
		p "*" * 90
		@company = Company.new(company_params)
		if @company.save
			redirect_to :root
		else
			render :"companies/new"
	end
	end


	def company_params
	params.require(:company).permit(:name, :email, :url, :phone, :short_description, :long_description, :image)
	end
end