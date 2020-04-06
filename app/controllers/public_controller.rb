class PublicController < ApplicationController

  def index
    @products = Product.order("RANDOM()").limit(4)
  end

end
