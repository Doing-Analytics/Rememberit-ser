class ProductsController < ApplicationController
  before_action :authenticate_request
  def index
    render json: { a: 1 }
  end
end
