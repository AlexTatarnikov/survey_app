class Api::V1::Users::RegistrationsController < Api::V1::BaseController
  def create
    @user = User.new(user_params)

    if @user.save
      respond_with({ jwt: @user.authentication_token }, status: 200 )
    else
      respond_with_error(@user)
    end
  end

  def user_params
    params.require(:sign_up).permit(:email, :first_name, :last_name, :password)
  end
end
