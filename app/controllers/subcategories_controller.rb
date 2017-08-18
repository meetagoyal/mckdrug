class SubcategoriesController < ApplicationController
    
  before_action :auth_admin

  def index
    @categories = Category.all
    @subcategories = Subcategory.all
  end

  def new
    @categories = Category.all
    @subcategory = Subcategory.new
  end

  def create
      
    @subcategory = Subcategory.new(params[:subcategory].permit(:name , :category_id))
    if @subcategory.save
      redirect_to subcategories_path
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