class SubcategoriesController < ApplicationController
    
  before_action :auth_admin

  def index
    @subcategories = Subcategory.all
  end

  def new
    @subcategory = Category.new
  end

  def create
      
    @category = Category.new(params[:ship].permit(:name))
    if @category.save
      redirect_to categotries_path
    else
      render 'new'
    end
  end

  def destroy
      subcategory = Subcategory.find(params[:id])
      subcategory.destroy
      redirect_to subcategories_path
  end

  def show
    
   
  end
end