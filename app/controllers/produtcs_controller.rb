class ProdutcsController < ApplicationController
  before_action :authenticate_request
  def index
    @products = Product.all
    render json: { a: 1 }
  end
end
