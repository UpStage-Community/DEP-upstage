class ProductionsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    before_action :check_production_member, only: [:member_show]
    before_action :check_company_member, only: [:new]

    def check_company_member
        @company = Company.where(id: params[:company_id])[0]
        if !@company
            redirect_to :root
        end
        @company_member = CompanyMember.where(user: current_user, company: @company)[0]
        if !@company_member
            redirect_to denied_path
        end
    end

    def check_production_member

    end

    def index
        @productions = Production.all
        # render 'index.json.jbuilder'
    end

    def show
        @paramsroduction = Production.find(params[:id])
    end

    def new
        @company = Company.find(params[:company_id])
        @production = Production.new
    end

    def create
        @company = Company.find(params[:company_id])
        @production = @company.productions.new(production_params)
        if @production.save
            redirect_to @production
        else
            redirect_to new_company_production_path(@company)
        end
    end

    def my_productions
        @productions = current_user.productions
    end

    def production_params
        params.require(:production).permit(:title, :description, :price_range, :ticket_url, :image)
    end
end