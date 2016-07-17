class ProductionsController < ApplicationController
  def index
    @productions = Production.all
    # render 'index.json.jbuilder'
  end

  def show
    @production = Production.find(params[:id])
  end

  def new
    @company = Company.find(params[:company_id])
    @production = Production.new
  end

  def create
    p params
    @company = Company.find(params[:company_id])
    @production = @company.productions.new(production_params)
    if @production.save
      redirect_to @production
    end
  end

  def production_params
    params.require(:production).permit(:title, :description, :price_range, :ticket_url, :image)
  end
end