require_relative '../../../services/jwt_auth.rb'
class Api::V1::ApiController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound do |e|
    render json: { error: e.message }, status: :unauthorized
  end
  rescue_from JWT::VerificationError do |e|
    render json: { error: "Invalid Token" }, status: :unauthorized
  end
  rescue_from  ActiveRecord::RecordInvalid do |e|
    render json: { error: e.message }, status: :unprocessable_entity
  end

  def authorize_user
    if request.headers['Authorization'].present?
      headers = request.headers['Authorization']
      decoded = JsonWebToken.decode headers
      set_current_user(decoded)
    else
      render json: {message:"Authorization token missing"}, status: :unprocessable_entity and return
    end

  end

  private
  def set_current_user(decoded_token)
     id= decoded_token[0]["id"]
     @current_user = User.find(id)
  end
end