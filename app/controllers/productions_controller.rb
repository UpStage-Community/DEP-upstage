class ProductionsController < ApplicationController
  def index
    @productions = Production.all
    # render 'index.json.jbuilder'
  end

  def show

  end

  def new
    @production = Production.new
  end

  def create
    p params
    @production = Production.new(production_params)
    if @production.save
      redirect_to root_url
    end
  end

  def production_params
    params.require(:production).permit(:title, :description, :price_range, :ticket_url, :image)
  end
end