class PublicController < ApplicationController

  def index
    @products = Product.order("RANDOM()").limit(5)
  end

end
