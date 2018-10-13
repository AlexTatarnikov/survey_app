class Api::V1::Admins::RegistrationsController < Api::V1::BaseController
  def create
    @admin = Admin.new(admin_params)

    if @admin.save
      respond_with({ jwt: @admin.authentication_token }, status: 200)
    else
      respond_with_error(@admin)
    end
  end

  def admin_params
    params.require(:sign_up).permit(:email, :password)
  end
end
