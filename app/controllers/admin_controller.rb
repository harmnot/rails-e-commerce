class AdminController < ApplicationController
  before_action :get_role, only: %i[create index]

  def index
    @products = Product.all
    @product = Product.new
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new product_values
    respond_to do |format|
      format.js {
        @products = Product.where(id: @product.id) if @product.save
        render 'admin/list'
      }
    end
  end



  private

  def product_values
    params.require(:product).permit(:name, :stock, :price, :desc, :photo)
  end


  protected

  def get_role
    redirect_to :root if !user_signed_in? || !current_user.admin?
  end

end
