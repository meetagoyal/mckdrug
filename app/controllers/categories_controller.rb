class CategoryController < ApplicationController
    
  before_action :auth_admin

  def index
    @categories = Category.all
  end

  def new
    @category = Category.all
  end

  def create
      
    # @ship = Ship.new(params[:ship].permit(:name, :photo))
    # if @ship.save
    #   redirect_to ships_path
    # else
    #   render 'new'
    # end
  end

  def destroy
    category = Category.find(params[:id])
    category.destroy
    redirect_to categories_path
  end

  def show
    @category = Category.find(params[:id])
   
  end
end