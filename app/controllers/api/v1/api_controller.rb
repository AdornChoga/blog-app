class Api::V1::ApiController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound do |e|
    render json: { error: "Invalid login details" }, status: :unauthorized
  end
end