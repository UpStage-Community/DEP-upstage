class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def index
    @users = User.all
  end

  def show
    if user_signed_in?
      @user = User.find(params[:id])
    else
      redirect_to :root
    end
  end

  def create
    p params
    redirect_to :root
  end
end