class Api::V1::UsersController < Api::V1::ApiController

  def login
    @user = User.find_by_email(params[:email])
    if @user && @user.valid_password?(params[:password])
      render json: { message: "Successfully" }
    else
      render json: { message: "Invalid"}
    end
  end

end