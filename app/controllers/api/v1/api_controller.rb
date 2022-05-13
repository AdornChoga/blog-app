require_relative '../../../services/jwt_auth.rb'
class Api::V1::ApiController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound do |e|
    render json: { error: e.message }, status: :unauthorized
  end
  rescue_from JWT::VerificationError do |e|
    render json: { error: "Invalid Token" }, status: :unauthorized
  end
  
  def authorize_user
    if request.headers['Authorization'].present?
      
      headers = request.headers['Authorization']
      
      decoded = JsonWebToken.decode headers
      # render json: decoded and return
       set_current_user(decoded)
      # render json: {user: @current_user} and return
    else
      render json: {message:"Authorization token missing"}, status: :unprocessable_entity and return
    end


  end
  private 
  def set_current_user(decoded_token)
     id= decoded_token[0]["id"]
     
    #  render :json => {id: id} and return
     @current_user = User.find(id)
  end
end