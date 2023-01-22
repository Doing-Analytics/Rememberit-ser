class ApiTestsController < ApplicationController
  before_action :authenticate_request
  def index
    render json: { a: "#{@current_user.name}" }
  end
end
