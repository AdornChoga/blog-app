require_relative '../../../services/jwt_auth.rb'
class Api::V1::ApiController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound do |e|
    render json: { error: "Invalid login details" }, status: :unauthorized
  end
  def authorize_user
    if request.headers['Authorization'].present?
      
      headers = request.headers['Authorization']
      
      decoded = JsonWebToken.decode headers
      render json: {token:decoded} and return
    else
      render json: {message:"Authorization token missing"}, status: :unprocessable_entity and return
    end


  end
end