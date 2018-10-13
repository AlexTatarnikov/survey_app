class Api::V1::Users::ResponsesController < Api::V1::BaseController
  before_action :authenticate_user

  def create
    @response = current_user.responses.build(response_params)

    if @response.save
      respond_with(ResponseSerializer.new(@response).serializable_hash)
    else
      respond_with_error(@response)
    end
  end

  def show
    @response = current_user.responses.find_by!(survey_id: params[:survey_id])

    respond_with(ResponseSerializer.new(@response, include: %i[survey],
                                        fields: { survey: %i[title subtitle] }).serializable_hash)
  end

  private

  def response_params
    params.require(:response).permit(:survey_id).tap do |response|
      response[:survey_id] = params[:survey_id]

      if params[:response].dig(:answers).present?
        response[:answers] = params[:response].fetch(:answers, ActionController::Parameters.new).permit!
      end
    end
  end
end
