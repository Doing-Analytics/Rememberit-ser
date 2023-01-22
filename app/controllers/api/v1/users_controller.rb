class Api::V1::UsersController < ApplicationController
  skip_before_action :authenticate_request
  def create
    user = User.new(user_params)
    if user.save
      render json: { status: "success", user: {name: user.name, password: user.password}  }
    else
      render json: { status: 'fail' }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.permit(:name, :email, :password)
  end
end
