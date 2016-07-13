class CompaniesController < ApplicationController
	before_action :authenticate_user!, only: [:new, :approve]

	def index
		@companies = Company.all.where(active: true)
	end

	def new
		# redirect to sign in if user not logged in

		@company = Company.new
	end

	def create
		# redirect to sign in if user not logged in

		@company = Company.new(company_params)
		if @company.save
			if Rails.env.production?
			end
			CompanyMailer.company_registered(@company).deliver_now
			@company.company_members.create(user: current_user)
			redirect_to thanks_path(type: "Company Registration")
		else
			render :new
	end
	end

	def approve
		@company = Company.find(params[:id])
		@company.active = true
		if @company.save
			CompanyMailer.company_approved(@company).deliver_now
		end
		redirect_to :root
	end

	def company_params
		params.require(:company).permit(:name, :email, :url, :phone, :short_description, :long_description, :image)
	end
end