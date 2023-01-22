class ApplicationController < ActionController::API
  include Pundit::Authorization
  
  before_action :authenticate_request
  attr_reader :current_user

  def current_user
    @current_user
  end

  private

  def authenticate_request
    @current_user = AuthorizeApiRequest.call(request.headers).result
    render json: { error: 'Not Authorized' }, status: 401 unless @current_user
  end
end
