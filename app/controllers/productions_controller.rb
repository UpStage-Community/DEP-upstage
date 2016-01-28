class ProductionsController < ApplicationController
  def index
    @productions = Production.all
    render 'index.json.jbuilder'
  end

  def show

  end
end
