require_relative '../../../services/jwt_auth'

class Api::V1::UsersController < Api::V1::ApiController

  def login
    @user = User.find_by_email!(params[:email])
    if @user && @user.valid_password?(params[:password])
      token = JsonWebToken.encode({ id: @user.id })
      render json: { token: token }
    else
      render json: { error: "Invalid login details"}, status: :unauthorized
    end
  end

end