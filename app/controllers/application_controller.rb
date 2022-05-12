class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception, unless: :json_request?
  protect_from_forgery with: :null_session, if: :json_request?
  skip_before_action :verify_authenticity_token, if: :json_request?
  before_action :update_allowed_parameters, if: :devise_controller?

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden }
      format.html { redirect_to root_path, alert: exception.message }
    end
  end

  rescue_from ActionController::InvalidAuthenticityToken, with: :invalid_auth_token
  before_action :set_current_user, if: :json_request?

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(
        :name, :email, :bio, :photo, :role,
        :password_confirmation, :password
      )
    end
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(
        :name, :email, :bio, :photo, :role,
        :password_confirmation, :password, :current_password
      )
    end
  end

  private

  def json_request?
    request.format.json?
  end

  # Use api_user Devise scope for JSON access
  def authenticate_user!(*args)
    super and return unless args.blank?

    json_request? ? authenticate_api_user! : super
  end

  def invalid_auth_token
    respond_to do |format|
      format.html do
        redirect_to sign_in_path,
                    error: 'Login invalid or expired'
      end
      format.json { head 401 }
    end
  end

  # So we can use Pundit policies for api_users
  def set_current_user
    @current_user ||= warden.authenticate(scope: :api_user)
  end
end
