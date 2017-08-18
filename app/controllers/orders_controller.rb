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
   
    @category = Category.find(params[:category_id])
    @subcategory = Subcategory.find(params[:subcategory_id])
    @products = @subcategory.products
    render 'new'
  end
  
  def select_product
    @subcategory = Subcategory.find(params[:subcategory_id])
    @product = Product.find(params[:product_id])
    @order = Order.new
    render 'new'
  end
  
  
  def create 
    
    @subcategory = Subcategory.find(params[:order][:subcategory_id])
    @product = Product.find(params[:order][:product_id])
    @order = Order.new(params[:order].permit(:user_id , :product_id))
     
     ordqty = (params[:order][:quantity]).to_i
     totalqty = @product.quantity
      
        if  (ordqty < totalqty) then
            @order.quantity = ordqty
            @order.cost = @product.price * ordqty
            @order.user_id = @user.id
            
            if @order.save
              redirect_to orders_path
            else
               @product = Product.find(params[:order][:product_id])
              render 'new'
            end
        
        else
          
          @order.errors.add(:order, 'order qty exceeds available qty') 
          @product = Product.find(params[:order][:product_id])
          render 'new'
        end
 end

  def destroy
      order = Order.find(params[:id])
      order.destroy
      redirect_to orders_path
      
  end

  def show
    
   
  end
  
end




