# frozen_string_literal: true

class Api::SessionsController < Devise::SessionsController
  skip_before_action :verify_signed_out_user
  respond_to :json
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    # render :json => auth_options and return
    # @user = User.find_by_email(params[:email])
    # if valid_password?(params[:password])
    #   render :json => { message: "Valid details"}
    # else
    #   render :json => { message: "Invalid details"}
    # end
    resource = warden.authenticate!(auth_options)
    render :json => { resource: resource} and return
    unless request.format == :json
      sign_out
      render status: 406,
             json: { message: 'JSON requests only.' } and return
    end
    
    if resource.blank?
      render status: 401,
             json: { response: 'Access denied.' } and return
    end

    sign_in(resource_name, resource)
    respond_with resource, location: after_sign_in_path_for(resource) do |format|
      format.json do
        render json: { success: true,
                       jwt: current_token,
                       response: 'Authentication successful' }
      end
    end
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  private

  def current_token
    request.env['warden-jwt_auth.token']
  end
end


