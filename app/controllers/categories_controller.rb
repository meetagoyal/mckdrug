class CategoriesController < ApplicationController
    
  before_action :auth_admin

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
      
    @category = Category.new(params[:category].permit(:name))
    if @category.save
      redirect_to categories_path
    else
      render 'new'
    end
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