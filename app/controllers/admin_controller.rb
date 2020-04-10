class AdminController < ApplicationController
  before_action :role_admin, only: %i[create index edit destroy]

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

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.update!  product_values
    redirect_to admin_path
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

  def destroy
    Product.find_by(id: params[:id]).destroy
    redirect_to admin_path
  end

  private

  def product_values
    params.require(:product).permit!
  end

  protected

  def role_admin
    redirect_to :root if !user_signed_in? || !current_user.admin?
  end

end
