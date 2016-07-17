class CompaniesController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
	before_action :check_company_admin, only: [:admin_show]

	def check_company_admin
		@company= Company.where(id: params[:id])[0]
		if !@company
			redirect_to :root
			return
		end
		@company_member = CompanyMember.where(user: current_user, company: @company)[0]
		if !@company_member || !@company_member.admin
			redirect_to denied_path
		end
	end

	def index
		@companies = Company.all.where(active: true)
	end

	def show
		@company = Company.find(params[:id])
	end

	def admin_show
		@company = Company.find(params[:id])
		@productions = @company.productions
	end

	def my_companies
		@companies = current_user.companies
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
			@company.company_members.create(user: current_user, admin: true)
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