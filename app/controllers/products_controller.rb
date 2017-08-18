class ProductsController < ApplicationController
    
  before_action :auth_admin

  def index
    @products = Product.all
  end

  def new
    @categories = Category.all
   
    @product = Product.new
    
  end


def select_category
    @category = Category.find(params[:category_id])
    @subcategories = @category.subcategories
    render 'new'
  end

  def select_subcategory
    
    @product = Product.new
    @category = Category.find(params[:category_id])
    @subcategory = Subcategory.find(params[:subcategory_id])

    render 'new'
  end
  
  
  def create
    @product = Product.new(params[:product].permit(:name ,:price , :packsize , :quantity, :subcategory_id , :photo))
    if @product.save
      redirect_to products_path
    else
      render 'new'
    end
  end

  def destroy
    
      product = Product.find(params[:id])
      product.destroy
      redirect_to products_path
      
  end

  def show
    
   
  end
  
end