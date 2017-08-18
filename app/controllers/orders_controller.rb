class OrdersController < ApplicationController
    
  before_action :auth_user
  
  def new
    @categories = Category.all
    @order = Order.new
  end
  
  def index
    
     @orders = @user.orders
  end
  

def select_category
    @category = Category.find(params[:category_id])
    @subcategories = @category.subcategories
    render 'new'
  end

  def select_subcategory
    @order = Order.new
    @category = Category.find(params[:category_id])
    @subcategory = Subcategory.find(params[:subcategory_id])
    render 'new'
  end
  
  
  def create
    @order = Order.new(params[:product].permit(:name ,:price , :packsize , :quantity, :subcategory_id , :photo))
    if @order.save
      redirect_to orders_path
    else
      render 'new'
    end
  end

  def destroy
      order = Product.find(params[:id])
      order.destroy
      redirect_to orders_path
      
  end

  def show
    
   
  end
  
end