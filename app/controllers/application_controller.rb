class ApplicationController < ActionController::API
  include Knock::Authenticable

  respond_to :json

  rescue_from ActionController::ParameterMissing do |exception|
    bad_request(nil, exception.message)
  end

  private

  def bad_request(key=nil, message=nil)
    render json: { errors: { message: message || I18n.t('errors.requests.bad_request') } }, status: 400
  end

  def not_found(message)
    render json: { errors: { message: message } }, status: 404
  end
end
