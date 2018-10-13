class Api::V1::Admins::TokensController < Api::V1::BaseController
  rescue_from ActiveRecord::RecordNotFound do |_|
    not_found(I18n.t('errors.sign_in.not_found'))
  end

  before_action :authenticate, only: [:create]

  def create
    render json: auth_token, status: :created
  end

  private

  def authenticate
    unless entity.present? && entity.authenticate(auth_params[:password])
      raise Knock.not_found_exception_class
    end
  end

  def auth_token
    Knock::AuthToken.new payload: { sub: entity.id }
  end

  def entity
    @entity ||= entity_class.find_by email: auth_params[:email]
  end

  def entity_class
    entity_name.constantize
  end

  def auth_params
    params.require(:sign_in).permit(:email, :password)
  end

  def entity_name
    'Admin'
  end
end
