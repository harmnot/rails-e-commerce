class AdminController < ApplicationController
  before_action :get_role

  def index
    @product = Product.new
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new product_values
    respond_to do |format|
      if @product.save
        format.html { redirect_to :root }
      else
        puts "ERRRORR HERE"
        format.js { render 'admin/error' }
      end
    end
  end

  private

  def product_values
    params.require(:product).permit(:name, :stock, :price, :desc, :photo)
  end


  protected

  def get_role
    if !user_signed_in? || !current_user.admin?
      redirect_to :root
    end
  end

end
